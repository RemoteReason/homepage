%{
  title: "LLM's as general purpose classifiers",
  thumbnail: "03-15-llm-as-general-purpose-classifiers.png",
  author: "Paul Sabou",
  tags: ~w(llm gen_ai),
  description: "With LLM's non-technical people can build & improve classifiers simply by using natural language. This is a big change and an important opportunity for all companies out there"
}
---

## Overview

Many apps need to process user text based input: sentiment polarity, profanity, language style, language detection, intent, etc. 

Before LLM's we had to build specialised classifiers for each domain of classification. This was often expensive and required dedicated technical teams & ML engineers.

With LLM's non-technical people can build & improve classifiers simply by using natural language. This is a big change and an important opportunity for all companies out there.
## Pre-LLM - Specialised classification models

Before LLM's we used very narrow ML models that were designed & trained on that purpose alone. Examples of such libraries are
* [language detection](https://github.com/minibikini/paasaa)
* [sentiment polarity analysis](https://textblob.readthedocs.io/en/dev/)
* etc.

Most of these models were computationally efficient but they had important overall drawbacks
* required specialised knowledge (ie. Support Vector Machines for sentiment polarity, etc.)
* curated training & validation data (ie. start with a human curated set of 5k tweets in English & each labeled with the sentiment polarity)
* tweak & retrain to handle edge cases

This required your technical team to include an ML engineer and that was not cheap or easy to recruit & keep. Also you had to build a training & validation data set.

Each classifier was a project in itself with requirements, testing & go to production roadmap. It basically required a team and a budget which limited both experimentation and iteration speed.

## LLM based classifiers

Using LLM's for classification tasks can sometimes feel like major overkill. We use a technique that is orders of magnitude more sophisticated & computationally expensive than specialised (pre LLM's) libraries. This insight is correct engineering wise. But the benefits are worth the overkill.

The main reason why it makes perfect sense to use LLM's is because it's way more easy to actually build a classifier. 

In practice many LLM based classifiers are implemented with straightforward and easy to understand prompt engineering. With a bit of help, prompt engineering can be handled by a non-technical person. That means we can iterate much faster and the team can run many more experiments (as we need less people & budget for each individual experiment).

To build an LLM based classifier we need three things
1. a good enough prompt
2. a set of test examples to make sure our prompt works
3. use a instruct LLM model that is good at following orders

### Example - Intention classifier for chatbot

Our website has a chatbot that allows our visitors to ask questions and request things directly in the chat window.  

For each visitor conversation we need to decide to redirect them to the right person that speaks their language and also has the role compatible with their intention. 

In a simple case we can assume that there are 4 types of intentions
- purchase - redirect them to sales rep
- education - provide them relevant links from our products & services pages
- support - redirect them to a customer support rep
- careers - get them in contact with our recruiter

**Component 1 - a clear prompt giving instructions**

Our classifier could use a prompt that is as simple as this

```
You are a smart receptionist that helps to redirect our website visitors to the right person in our company. 

Use the conversation below and classify it in one of the following intents
- "purchase" : when the text contains an intention to buy or suggest a need for information about the pricing of one of our products
- "education" : when the text contains questions about how a product product or service works
- "support" : when the text contains a complaint about something that doesn't work as expected
- "careers" : when the text contains questions about applying for a role at the company, open positions, etc.

If you cannot classify the intent in one of the 4 categories above them simply answer "unknown". If you can classify the answer in one of the above intents provide only the name of the intent as an answer. 

The conversation to classify is provided below between <BEGIN> and <END> tags.

<BEGIN>
......
<END>

```

Note: in real life the prompt would probably be more complex as it should also include examples for existing intents and for the unknown case.

**Component 2 - examples to evaluate performance**

Example 1
- input text - "I want to find a job at your company"
- correct answer - "careers"

Example 2
- input text - "I need a quote for custom software development for a mobile app"
- correct answer - "purchase"

Example 3
- input text - "I don't like your site. The contact form doesn't really work"
- correct answer - "support"

Example 4
- input text - "The weather is really nice. Why don't you have a weather widget on your landing page?"
- correct answer - "unknown"

**Component 3 **
- use any instruct model - [see leaderboard](https://huggingface.co/collections/open-llm-leaderboard/open-llm-leaderboard-best-models-652d6c7965a4619fb5c27a03)

**DONE!**

## Why is this a big thing?

Looking at the classifier above it's clear that most of it can be defined by a product or marketing person. Defining the classifier requires a human to explain in plain language what should the LLM do and also what criteria's to use to do the classification. Additionally the LLM is also given some positive & negative examples that can be used to enhance the prompt but also for automatic testing with an "eval framework".

Basically with LLM's we have replaced the entire ML engineering team with a non-technical person that understands the business & the customer journey. 

The consequence is that now we can "build" many more classifiers and also iterate fast and at a greatly reduced cost (and development time). 

This empowers our non-technical team (ie. product, marketing, sales, support, etc.) to work on their own and produce valuable automation blocks that bring better user experience and more overall value to the business. 

When natural language is the "programming language" we are all part of the engineering team.