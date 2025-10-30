%{
  title: "Balancing Auditability and Privacy with Crypto-Shredding",
  thumbnail: "11-21-balancing-auditability-and-privacy-with-crypto-shredding.png",
  author: "Paul Sabou",
  tags: ~w(cryptography gdpr compliance better_apps),
  description: "Regulated industries require apps to keep immutable (ie. append only) event logs for years. Sometimes even in air gapped archives. But GDPR allows users to demand that we delete the data. Crypto shredding as the only realistic solution that can handle both requirements"
}
---
## Overview
Modern software in regulated industries (like healthcare and finance) faces a conflict:
* Auditability laws require tamper-proof, long-term storage of event logs.
* Privacy laws (GDPR) require users’ personal data to be erasable on request.

Deleting data conflicts with the need for immutable audit trails — especially across backups and air-gapped storage.

**Solution: Crypto-shredding (cryptographic erasure)**

Instead of deleting data, systems encrypt sensitive information with user-specific, time-scoped keys and later make it unreadable by deleting those keys.

**How it works:**
* Each user gets unique encryption keys (rotated periodically and securely stored).
* Sensitive fields in audit logs are encrypted per user, while non-sensitive data remains visible for auditing.
* When a deletion request arrives, the system removes the relevant keys, making only that user’s data unreadable without breaking audit integrity.

**This approach:**
* Respects both privacy and compliance laws.
* Works with backups and air-gapped archives.
* Supports selective or temporary data removal.

**Result: Crypto-shredding offers a practical, compliant way to balance immutable audit trails with users’ right to privacy.**

**Bonus: At the end of the article we show a straghtforward way to get this done in Elixir.**


## A. The Problem

Many software systems operate in (increasingly) regulated industries. Good examples include healthcare, legal tech (ie. document signing, etc.), financial and others.
As software becomes common across various industries, software products end up having to be compliant with more and more rules. 

Here I want to focus on a data architecture tradeoff that common in most regulated industries: auditable data vs. the right to privacy. 

### A.1 Auditable data (read only)
Auditable data is the foundation of most compliance requirements. The software system must keep an an event trail that provides an auditable
history of who did what. 

For example in a document signing platform an auditor would like to see events like: document creation, invitations to approve/sign, approving, signing & final download. 
This event trail would provide enough detail to an auditor to evaluate compliance, use it in a legal case (or any related legal process).

The event trail has to be stored for years (ie. typical is 7 years) in an read only archive with various backup requirements. The storage requirement is a historical legal requirement
from the times when we used paper for all documents. These documents had to be stored in safe places (ie. controlled humidity, fire proof, etc.) and access to them had to be controlled carefully.

For software auditable event logs we have similar requirements but adapted for the digital nature of the artefacts. 
The legal requirement is to have read only & tamper proof storage system because this provides a guarantee that they cannot be changed after the fact. (ie. we signed a contract 2 years ago but yesterday someone changed the sell price retroactively). Additionally the law requires that these event logs be backedup in several places (and in some cases in air gapped storage facilities).


### A.2 Right to privacy (GDPR)
The right to privacy is a component of larger legal data protection frameworks (ie. [GDPR & equivalent framworks](https://pro.bloomberglaw.com/insights/privacy/privacy-laws-us-vs-eu-gdpr/)). 
These legal frameworks state that the user (as person) is the legal owner of the data it has created. As owner of the data the user has the right to demand that some (or all) of his data is removed from a software system.

For example in a document signing platform the user can make a GDPR request that requires the platform to delete all his data during the last year. Practically this means that the software system needs to have a way to
(1) identify all data that the user owns & (2) destroy it (or make it unreadable). 


### A.3 - Problem 1 - Where is the data?
Keeping track of data storage is far from trivial. Software systems keep data in live databases (ie. Postgres, etc.), primary backups (ie. database backups) and secondary and long term backups.
Some of these long term backups can be stored in air gapped storage systems that are no longer in our direct infrastructure. If we want to investigate them we need to make a request to our long term storage 
provider, wait a while (ie. for [AWS Glacier](https://docs.aws.amazon.com/AmazonS3/latest/userguide/glacier-storage-classes.html) up to 48 business hours) and then process them.
To make all this possible we need strong data governance both for our active data (ie. in our live database) but also in our backups (both primary and long term). 
Building & maintaining software with strong data governance is complex and expensive.

### A.3 - Problem 2 - How to destroy the data?
When we destroy a user data we need to make sure of two things: (1) destroy all the data & (2) no collateral damage.

When a user demands that his data is destroyed we really need to make sure all the data owned by the user is removed. We cannot
have a situation where a backup is stored in an air gapped system and we don't destroy the user data in that particular backup.
We need to be able to provide a reasonable proof that we destroyed the data (ie. show what we did & when). 

Collateral damage is an important concern as well. Users often collaborate with each other in joint activities. In the document signing
example three users work together to sign an employment contract (ie. the employee, the manager, the general director). When we destroy the data of a user
we need to make sure that (1) we do not delete the data of the other users in the joint activities and (2) the data removal of a user has a minimal impact on the auditability of the joint activities. 

### A.4 The right balance that is practical

Practically we need to find the right balance between auditable (and immutable) data and the right to privacy. The right to privacy demands us to be able to remove the data retroactively but that contradicts the
legal requirement of an immutable (read only) auditable event log. We need to be able to implement this in software in a practical way that is cheap to build & operate. 


## B. The solution - Crypto Shredding
Crypto-shredding or crypto erase (cryptographic erasure) is the practice of rendering encrypted data unusable by deliberately deleting or overwriting the encryption keys.

Crypto-shredding requires us to design our audit trail systems the following way

### B.1. Time scoped user cryptographic keys
Each user in our system needs to be assigned a unique cryptographic key. 
This key is simmetrical (ie. just like a regular password) and can be used to both encrypt and decrypt data. 

The key is time scoped and and such the user will get a new unique cryptographic key every X days. 
The system has to keep track of all previously generated keys for the user. This is the only way the system
can decrypt historical data that was encrypted with the old keys.

The rotation period should be configurable as it will depend on country & industry specific regulatory requirements.

Generating new keys every X days provides two advantages
(1) if a key is compromised we compromise only a subsset of the encrypted data
(2) the system can be more selective on which encrypted data it "forgets" (ie. by removing only keys for a specific month)

This can be externalised to an external system like [AWS KMS](https://aws.amazon.com/kms/), a self managed/hosted vault (ie. [Hashicorp Vault](https://www.hashicorp.com/en/products/vault)) or some hybrid combination (ie. master key managed by KMS but used locally to encrypt & decrypt all keys). 

#### B.1.1 Trusted Platform Module
Just make sure you have safe way to store and manage at least the master key. The key management system must be resilient against [common attacks](https://en.wikipedia.org/wiki/Crypto-shredding) and that will require specialised hardware that implements [TPM](https://en.wikipedia.org/wiki/Trusted_Platform_Module). AWS KMS already makes use on such hardware so if you use AWS KMS you are safe from these attack vectors. 

If you decide to completely self manage then AWS offers EC2 instances with a TPM module capability via the [AWS NitroTPM](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitrotpm.html). 
This means that your Fargate deployments need to deploy on mchines with specially selected EC2 types. Your Elixir app can also work directly with these TPM hardware devices via libraries like [Elixir TPM](https://github.com/redwirelabs/tpm)

#### B.1.2 Post-quantum safe encryption
We expect that quantum computers to be able to easily crack many historically encryption algorithms condsidered safe. A malicious attacker might store historical data and at some point in the future use a quantum computer to decrypt it ([HNDL](https://en.wikipedia.org/wiki/Harvest_now,_decrypt_later)).
Since 2015 NIST provided recommandations for open source [post quantum safe cryptography](https://en.wikipedia.org/wiki/Post-quantum_cryptography). 
Simply select an algorithm that is post quantum safe and that's it. 
A practical choice is (AES-GCM). This is an encryption algorithm specified in [NIST Special Publication 800–38D](https://csrc.nist.gov/publications/detail/sp/800-38d/final). AES is by now [the most important symmetric encryption algorithm in the world](https://www.youtube.com/watch?v=NHuibtoL_qk&t=726s).

### B.2. Encrypt sensitive audit log events with user cryptographic keys
All event logs contain non-sensitive (ie. UUID's, etc.) and sensitive data (ie. names, social security numbers, etc.). Additionally each event log can potentially contain data that is owned by several distinct users.
As such we need to structure our event log data in user specific objects (ie. owned by only one user) and then encrypt all sensitive data fields using the user specific cryptographic key.

We encrypt only the sensitive data as this allows us to use the non-sensitive fields for basic retrieval tasks (important for auditors).
As the event log data is split across user boundaries this allows us to encrypt different parts of the event log with different user keys.

For example in a document signing platform we might store an event log that contains a list of users that were invited to sign the document.
Each user block in that array will have encrypted data wih the encryption key of that specific user. When in the future one user makes a request to have his data removed
we can make unreadbale only the data of that specific user (without affecting the readability of the data for the other users). 

This keeps the right balance between the data auditability (ie. the auditor can still see the other participating users in the audit trail) while respecting the legal right of a single user.

When we store the encrypted data we need to store the following
* encryption_key_id - so we know which key was used to encrypt the value
* encryption opts (ie. nonce, salt, size, etc.) - so we can reuse the same parameters during decryption 
* encryption algo - so we know which encryption algorithm was used
* encrypted value

### B.3. Selectively remove user unique cryptographic keys
This is the easy part. We need to have these keys (or their metainfo) stored somewhere in our main database. When a user makes a request to have his data removed we simply delete the user cryptograhic keys (from our database or from KMS) that are relevant for that specific time period. By deleting these keys we can guarantee that nobody would be able to read the encrypted audit logs no matter where these logs are stored (ie primary backup, long term air gapped storage, etc.). 

Additionally we need to do two more things :
* remove (or anonymise) the user data in our primary database
* store the "data removal" request for future reference so we can explain to an auditor why some audit data is unreadable


## C. Other uses for crypto-shredding
Once we have this system in place we can use it for more advanced use cases. Some examples

### C.1 Temporary suspended readability
A court order could temporarily restrict the platform (or operator) the right to read the data. 
In that case we can export the encryption keys of the user, delete them and hand them overto a court designated custodian for the duration of the legal dispute.
Once the legal dispute is concluded the custodian provides us the keys and we reimport them and everything is back to normal.

### C.2 Partial removal of historical data
For various legal reasons a user might request the platform to delete the data only for a specific period of time.
If our temporal scope is narrow enough (ie. at month or week level) then we can simply delete the user encryption keys for that specific time period.


### C.2 Air gapped backups (or external custody)
The crypto-shredding works with air gapped backups. We don't need access to the backup system to make this work.
The same applies for the situation where we have a difficult to contact external custodian for the data.

## D. How to do this in your Elixir app

### D.1 Encrypted string domain model
First you need to have a domain model for an encrypted value. Something like this should be a good start
```elixir
defmodule MyApp.ActivityLogs.Schemas.EncryptedString do
  @moduledoc false

  use MyApp, :schema

  alias MyApp.StringUtil

  @type t :: %__MODULE__{}

  embedded_schema do
    field :encryption_key_id, :string
    field :encryption_iv, :binary
    field :encryption_tag, :binary
    field :encrypted_string, :string
  end

  def changeset(%__MODULE__{} = encrypted_string, attrs \\ %{}) do
    encrypted_string
    |> cast(attrs, [:encryption_key_id, :encryption_iv, :encrypted_string, :encryption_tag])
    |> validate_required([:encryption_key_id, :encrypted_string, :encryption_iv, :encryption_tag])
  end

  def encrypt_from_plain_text(plain_text, %{
        encryption_key_id: encryption_key_id,
        encryption_key: encryption_key
      }) do
    {tag, iv, cipher_text} = StringUtil.encrypt(plain_text, encryption_key)

    changeset(%__MODULE__{}, %{
      encryption_key_id: encryption_key_id,
      encryption_tag: tag,
      encryption_iv: iv,
      encrypted_string: cipher_text
    })
  end

  def decrypt_to_plain_text(%__MODULE__{} = encrypted_string, %{
        encryption_key_id: encryption_key_id,
        encryption_key: encryption_key
      }) do
    if encrypted_string.encryption_key_id != encryption_key_id do
      {:error, :encryption_key_mismatch}
    else
      {:ok,
       StringUtil.decrypt(
         encrypted_string.encrypted_string,
         encrypted_string.encryption_tag,
         encryption_key,
         encrypted_string.encryption_iv
       )}
    end
  end
end
```
In our example we will use a post-quantum safe encryption algorithm - [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) 256 with [GCM](https://en.wikipedia.org/wiki/Galois/Counter_Mode) so we will have to store some extra info alongside the encrypted value:
* encryption_key_id - we need to know the specific user encryption key that was used to encrypt the value (as the key is simmetrical we use it to decrypt it as well)
* encryption_iv - initialization vector - also known as nonce or seed; this is used during the AES encryption and we need it for decryption 
* encryption_tag - message authentication code (MAC) or integrity check value ([ICV](https://www.cryptosys.net/pki/manpki/pki_aesgcmauthencryption.html))
* encrypted_string - end encrypted value that we will provide as input to the decryption function

### D.2 Encryption string functions
We will simply use the standard [:crypto](https://erlang.org/doc/man/crypto.html#crypto_one_time_aead-6) module from Erlang that provides a wide range of encryption algorithms.
[Read here](https://medium.com/@brucifi/how-to-encrypt-with-aes-256-gcm-with-erlang-2a2aec13598d) if you want to do this directly in Erlang. 
```elixir
defmodule MyApp.StringUtil do
  # 256 bits
  @key_length 32
  # AES-256-GCM is a secure cipher mode
  @cipher_mode :aes_256_gcm
  def encrypt(plain_text, key) when byte_size(key) == @key_length do
    # Generate a random IV
    iv = :crypto.strong_rand_bytes(16)

    {cipher_text, tag} =
      :crypto.crypto_one_time_aead(@cipher_mode, key, iv, plain_text, <<>>, true)

    {tag, iv, cipher_text}
  end

  def decrypt(cipher_text, tag, key, iv) when byte_size(key) == @key_length do
    :crypto.crypto_one_time_aead(@cipher_mode, key, iv, cipher_text, <<>>, tag, false)
  end
end
```
Again, simply use an algorithm that works within your regulatory framework (and performance constraints).


### D.3 The event log model
```elixir
defmodule MyApp.ActivityLogs.Schemas.UserActionX do
  @moduledoc false

  use Signetta, :schema
  alias MyApp.ActivityLogs.Schemas.EncryptedString

  embedded_schema do
    field :user_id, :binary_id

    field :event_version, :string
    
    embeds_one :event_checksum, EncryptedString, on_replace: :delete

    field :event_timestamp, :string

    field :action_type, :string
  
    embeds_one :first_name, EncryptedString, on_replace: :delete

    embeds_one :last_name, EncryptedString, on_replace: :delete

    embeds_one :email, EncryptedString, on_replace: :delete
  end
end
```

In the above example we have a user action event where we
* store the sensitive fields values as encrypted strings (each with it's own potentially independent encryption key)
* keep the field names unencrypted => we don't loose the structure of the event in the encryption which is good for debugging & human readers
* always have a "user_id" field where we store the UUID of the user that owns the data => ownership is always clear but easy to anonymise (if we decide to do it for that particular user id)
* store the event version as the schema might change over time => when that happens we will need encoders/decoders for each version
* store the event timestamp so we know when the event happened (which might be earlier than the actual insertion date)
* compute an event checksum on the event encrypted & unencrypted fields and encrypt it with the application key => this makes the event tamper proof 

### D.4 The key management

For key management we can use the [Elixir AWS KMS library](https://hexdocs.pm/aws/AWS.KMS.html) that allows us to externalise user key management to KMS. AWS has an initial quota of 100k KMS keys per account
which should be enough for a good start. The quota can be increased if needed or we can deploy each tenant in a different AWS account (and manage them via [AWS Organisations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)). AWS KMS requests are free as long as the keys are managed by AWS (ie. no customer provided key material).

There are many alternatives to AWS KMS both for cloud and self hosted. Either way keep in mind that key management is the most vulnerable part of the setup so make sure this is good enough for a compliance audit or pen test.

If you decide to roll out your own custom solution Elixir supports TPM via a NIF around a C TPM library. See [Elixir TPM](https://github.com/redwirelabs/tpm). If you really want own your key management system then you can look at 
[AWS CloudHSM](https://docs.aws.amazon.com/cloudhsm/latest/userguide/introduction.html) or the open source alternative [Hashicorp Vault](https://www.hashicorp.com/en/products/vault) that must be deployed on a machine with a TPM hardware ([FIPS 140-3 validated cryptographic modules](https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/4884))

## References
* [EDA Crypto Shredding](https://event-driven.io/en/gdpr_in_event_driven_architecture/#crypto-shredding)
* [Crypto Shredding](https://en.wikipedia.org/wiki/Crypto-shredding)
* [Harvest now, Decrypt later](https://en.wikipedia.org/wiki/Harvest_now,_decrypt_later)
* [Post-quantum cryptography](https://en.wikipedia.org/wiki/Post-quantum_cryptography)
* [How to encrypt with AES-256-GCM in Erlang](https://medium.com/@brucifi/how-to-encrypt-with-aes-256-gcm-with-erlang-2a2aec13598d)
* [Trusted Platform Module](https://en.wikipedia.org/wiki/Trusted_Platform_Module)
* [AWS KMS](https://aws.amazon.com/kms/)
* [AWS Organisations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
* [AWS NitroTPM](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitrotpm.html)
* [AWS CloudHSM](https://docs.aws.amazon.com/cloudhsm/latest/userguide/introduction.html)