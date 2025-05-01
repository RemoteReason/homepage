%{
  title: "Devops plan for incremental complexity",
  thumbnail: "11-20-devops-complexity.png",
  author: "Paul Sabou",
  tags: ~w(devops architecture),
  description: "Start as simple as possible. Increase complexity with great caution. Most additional complexity impacts your budgets & delivery times."
}
---

## 7 things to expect from devops
Within the [continous delivery](/continous-delivery-philosophy) philosophy, devops has an important role in each stage of the software development.
In practice this means that devops complexity will often increase alongside the overall software solution.

As such we need strategies to manage devops complexity. When we do a good job with devops the team moves faster & is more productive.
When we get it wrong the team productivity and momentum is often lost in dozens small annoyances & irritations.

In practice devops means 7 things

### 1. Runtime environment
The code & all dependent services should have a runtime environment that runs the same way independently of the OS of the host machine.
This is typically handled with virtualization (ie. VM's or other) & containerization (ie. Docker, etc.).

### 2. Secure credentials
All software components need some type of credentials to work together. These can be database connection credentials, certificates, JWT tokens, etc.
We need to have a practical way to store & update these credentials in an environment appropriate way. For dev we keep them on our local
machines but for prod they are stored in secure vaults provided by the production infrastructure.

### 3. Infrastructure setup
We expect that software components are deployed the same way in all environments. For example if we need a Postgres server in production
we should also have the same Postgres server in development. The two dependencies are the same in both environments. The only difference
might be database size, memory allocation, etc. This is typically achieved following the "infrastructure as code" approach.

### 4. Automated releases
Software moves through several stages : development, testing, pre-prod, production. We expect this workflow to be automated so that
we can release to production with minimal manual intervention. This provides confidence in the repeatability of the release process &
other related things like rollbacks, backups, etc. This is handled via a CI/CD pipeline that is triggered when new code is pushed in the
code repo. The CI/CD pipeline takes care of compilation, packaging & infrastructure deployment.

### 5. Auto-scaling
We expect the infrastructure to scale easily both in number of instances but also in geo distribution.
That means that we should be able to configure auto-scaling or have access to a simple infrastructure scaling tool (ie. an admin web interface, etc.)

### 6. Self service
The development team (and all related teams) should be able to do work without blocking on the "ops team". 
As such the development team should be able to use some sort of web interface (or command line) to generate credentials, create a development
infrastructure, get production logs / traces, etc. This allows them to be fully autonomous in coding new features, fixing bugs, etc.

### 7. Pay as you go
Ideally the infrastructure setup should cost as much as it's used. When the team uses less (ie. outside office hours, etc.) the relevant
resources should be stopped automatically. When the team needs more resources just for a couple of hours then infrastructure should increase
and the company should be charged only for this hours. In practice this requires us to to a cloud provider (like AWS or Render).
 
## Start with a good foundation
### 1. Monorepo
A monorepo is an effective way to start & can get your team a really long way; This approach facilitates “big picture” communication & simpler release processes.

### 2. GitOps
Leverage Git based processes as much as possible : homepage / blog, devops (via deployment pipelines), code, assets management, project management.

### 3. Single Sign On 
For most projects you will have to use some third party services for some features of your project (ie. logging - Sentry, performance monitoring, search - Algolia, etc.). 
Make sure your dev team can self-service easily. This way they don't need a manager or admin to get credentials, provision resources, etc. 

This can be achieved by using Single Sign On. 

If SSO is too expensive then just hack it with a shared account :
* create a company account like "team_project_abc&company.com" and use it for all your third party services
* share the credentials of this account to all the dev team members


## 3 stages of devops complexity

Start as simple as possible. Increase complexity with great caution. Most additional complexity impacts your budgets & delivery times.

### 1. PaaS
Platform as a Service are the opposite of generalists cloud providers like AWS, GCP or Azure. PaaS services are easy to use, cheaper
and provide an ideal environment for your first deployments. 

We recently had good experience with [Render](https://render.com), [Fly](https://fly.io) & [Vercel](https://vercel.com/).
They work well for typical webapp & backend setups. Besides these there are dozens more as each focus on a specific niche. 

The most important thing is to remember that a PaaS is like a ["batteries included" web framework](/batteries-included-web-frameworks). They are very oppinionated & focused on specific
types of apps. As such make sure most of your needs are provided by the PaaS out of the box. Workarounds are not easy & often you have to compromise
on your side.

What to expect from a good PaaS :
* Docker runtime environment
* Secure credentials vault
* Infrastructure as code (typically via a YAML or JSON infra description file)
* basic CI/CD pipeline (triggered by git commits)
* auto scaling
* managed basic services (ie. database, message queue, static file storage, load balacing, SSL, etc.)
* self service via web admin
* pay as you go with good prices (better than AWS) & generous free tier offers

At some point your devops setup will outgrow the your initial PaaS ecosystem. 
You can push things further with workarounds or a multi PaaS setup. 
But this helps up to a point & after that you need to move on.

### 2. Generalist Cloud Providers
![Generalist Cloud Providers](./3-big-cloud-providers.png 'Generalist Cloud Providers')

Generalist Cloud Providers offer a vast ecosystem of infrastructure services. They offer much more than a simple PaaS. The downside is that the infrastructure is harder to setup & can cost quite a bit more.
There are three large providers of generalist cloud services : [AWS](https://aws.amazon.com/?nc2=h_lg), [Google Cloud](https://cloud.google.com/) & [Azure](https://azure.microsoft.com/).
All have similar offers.

At some point you might decide that your cloud infrastruture costs too much. When you reach that threshold you can decide to
switch all (or part) of you infrastructure to bare metal. 

### 3. Bare metal & multi cloud
![Kubernetes](./kubernetes.jpg 'Kubernetes')

A bare metal provider (ie. like [Hetzner](https://www.hetzner.com/)) offers dedicated machines that are located in a data center. 
They only provide hardware maintainance (ie. replacing a damaged hard drive, etc.) and good network connectivity.

The main advantage is much lower infrastructure cost. The main disadvantage is that you have to manage all the OS & applications yourself.
Managing things yourself means that you end up paying for some extra devops hours. If your infrastructure costs is high enough then this might make perfect sense.

A typical bare metal setup requires you to install & manage some sort of distributed container management system like [Kubernetes](https://kubernetes.io/).
On top of that you will end up deploying the same kind of containerized infrastructure as before.

When they reach this stage, most companies prefer to have a multi cloud setup. They keep one part of their infrastructure in one of the generalist cloud providers
and setup a separate self managed cluster with a bare metal provider. This allows them to keep some of the benefits of the generalist cloud providers
while reducing overall operating costs. 

## References
- [Continous Delivery](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912)
- [GitOps](https://about.gitlab.com/topics/gitops/)  
- [DORA reports](https://www.devops-research.com/research.html)
- [Continous Delivery - Dave Farley](https://www.youtube.com/@ContinuousDelivery/featured)