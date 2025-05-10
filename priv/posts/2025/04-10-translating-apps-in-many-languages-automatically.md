%{
  title: "Translating apps in many languages automatically",
  thumbnail: "04-10-translating-apps-in-many-languages-automatically.png",
  author: "Paul Sabou",
  tags: ~w(llm gen_ai better_apps),
  description: "Localising your app (translating text, dates, currencies, etc.) helps reach more users and should be part of any growth strategy. While human translation is costly, modern LLMs like GPT-4 offer affordable, high-quality automated translation."
}
---

## Overview
Localising your app (translating text, dates, currencies, etc.) helps reach more users and should be part of any growth strategy. While human translation is costly, modern LLMs like GPT-4 offer affordable, high-quality automated translation.

To implement localisation:

* App Translation – Use tools like gettext_llm to auto-translate UI during development.
* Documentation – Translate manuals and API docs.
* Training Content – Use tools like Descript to localise video tutorials.

LLMs make localisation fast, scalable, and budget-friendly.

## Localisation is a business opportunity

Growth teams main focus is to get more people to use our product. A core factor in the growth strategy is reaching out to as many potential customers as possible.

It's a known fact that people have a strong bias to buy & use products in their own language. As such making your app multi lingual should be a basic ingredient in your growth strategy. 

Localisation is bigger than translation as it also includes local date, number and currencies. 

Implementing localised dates, numbers and currencies is straightforward and fast in most development frameworks. Most of these localisation libraries are thin wrappers around the CLDR database and as such provide reliable & consistent localisation for almost 700 languages & all world countries.

Most of the real effort of localisation is taking care of translating all the texts in multiple languages. 

## Speeding up the translation process with LLM's
Translating from one language to another requires the translator to be accurate and to maintain a consistent tone/persona and style. Scaling these to multiple languages is challenging.

Companies (especially early stage) have difficulties allocating budget for human translators
to take care of localisation. The next best thing to that is machine translation. 

Automated translation with LLM's provide a "good enough" alternative in many use cases.

Machine translation quality has improved substantially during the last 5 years. The last major bump in quality comes from LLM's. Especially the bigger (and more expensive) models.


> Through systematic human evaluation using the MQM schema, we assess translations across three language pairs (Chinese⟷English, Russian⟷English, and Chinese⟷Hindi) and three domains (News, Technology, and Biomedical). Our findings reveal that GPT-4 achieves performance comparable to junior-level translators in terms of total errors, while still lagging behind senior translators. Unlike traditional Neural Machine Translation systems, which show significant performance degradation in resource-poor language directions, GPT-4 maintains consistent translation quality across all evaluated language pairs.

[Benchmarking GPT-4 against Human Translators: A Comprehensive Evaluation Across Languages, Domains, and Expertise Levels](https://arxiv.org/html/2411.13775v1)

Read [here](https://localazy.com/blog/the-great-llm-translation-war-a-comparison-of-the-hottest-ai-models?srsltid=AfmBOooPW6QGfyea1uwSy7UpZgiu9XvcRBBXsS6BTQKAYB3XhnxqjqxX) an in depth comparison of the performance of different commercial LLM's models for natural language translation.

In practice even the most expensive LLM's require moderate budgets (less than 100 EUR) to translate your app content in multiple languages. 

## How to get started right away

Once we decided to localise the product we have to look at 3 areas 
* application
* documentation
* training

### 1. Application translation
The application localisation means that we localise all dates, currencies and numbers and also all the texts (ie. labels, messages, explanations, etc.) in our app(s). If your product consist of a web app and a mobile app then both should be localised. 

The most efficient technique is to make use of library that uses an LLM endpoint to automatically translate all the relevant application texts in all target translations.

For example in a Phoenix/Elixir app you could use something like [gettext_llm](https://github.com/paulsabou/gettext_llm) and add it in your pre commit scripts. 

The library requires you to provide an LLM model & API key and it will use it to automatically translate all the app texts for you. The configuration also allows the developper to indicate a translation tone/persona and style
```# General application configuration
import Config

config :gettext_llm, GettextLLM,
  # ignored_languages: ["en"] <--- Optional but good to skip translating your reference language 
  persona:
    "You are translating messages for a website that connects people needing help with people that can provide help. You will provide translation that is casual but respectful and uses plain language.",
  style:
    "Casual but respectul. Uses plain plain language that can be understood by all age groups and demographics.",
  endpoint: LangChain.ChatModels.ChatOpenAI,
  endpoint_model: "gpt-4",
  endpoint_temperature: 0,
  endpoint_config: %{
    "openai_key" =>
      "<YOUR_OPENAI_KEY>",
    "openai_org_id" => "<YOUR_ORG_ID>"
  }
```

Every time the code is about to be committed to git (CI/CD) the following mix tasks runs
```
mix gettext.extract
mix gettext.merge priv/gettext --no-fuzzy
```

That's it. The engineering team configures this once for you project and it automatically keeps up to date & translates all new texts in all target languages. 

### 2. Application documentation
The documentation is about user manuals, API docs, etc. In some cases customers expect these to be localised as well. Translating these with LLM's (like with the app) is a good way to get started & deliver fast.

### 3. Application educational materials
The education is about training materials. Many products use video tutorials (ie. video demo's) or guided presentations with screenshots and texts. Most customers expect these to be in their own language as well.

Currently the best approach for educational materials is the following
- record your video/ screen share in English
- use a service like Descript to convert the video into derived videos & Descript allows you to select the target language & voice => it will generate it for you
- upload the video in a separate youtube playlist (one per language)

## References
* [Benchmarking GPT-4 against Human Translators: A Comprehensive Evaluation Across Languages, Domains, and Expertise Levels](https://arxiv.org/html/2411.13775v1)
* [LLM translations comparison](https://localazy.com/blog/the-great-llm-translation-war-a-comparison-of-the-hottest-ai-models?srsltid=AfmBOooPW6QGfyea1uwSy7UpZgiu9XvcRBBXsS6BTQKAYB3XhnxqjqxX)