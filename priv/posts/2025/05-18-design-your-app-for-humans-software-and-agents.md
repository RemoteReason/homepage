%{
  title: "Design your App for Humans, Software and Agents",
  thumbnail: "05-18-design-your-app-for-humans-software-and-agents.png",
  author: "Paul Sabou",
  tags: ~w(llm gen_ai better_apps),
  description: "When designing modern software products, it's crucial to recognize that different users—whether humans, external systems, or intelligent agents—interact with your product in fundamentally different ways."
}
---

## Overview

When designing modern software products, it's crucial to recognize that different users—whether humans, external systems, or intelligent agents—interact with your product in fundamentally different ways. To accommodate these diverse needs, we architect our product around a shared core, and then build specialized interfaces on top of it:

* GUIs (Graphical User Interfaces) for human users
* APIs (Application Programming Interfaces) for external software
* MCPs (Model Context Protocols) for LLM-based agents

Each interface is designed with its own audience in mind, shaped by the constraints, expectations, and communication styles unique to that group. We need to approach the design, documentation, security, and optimization of each interface in different ways. Each delivers the most value possible within its specific context.

By treating these interfaces as first-class, audience-specific products—with their own roadmaps and goals—we ensure that our core functionality is delivered in the most effective and user-aligned way possible.

## 1. Graphical User interface - consumed by humans

**Audience**

The GUI is used by human beings via web or mobile. The whole experience is "turn based":  the user triggers something & waits the interface to finish the task & show some results. After that the user triggers something else & the interface does something, etc.

The entire experience is optimised for low bandwidth data transfers (ie. one screen at a time) as humans have a limited capacity to read & "process" data.

Onboarding is a core element of the experience & make or break for commercial success.

**Documentation**

The documentation is designed to be consumed by human beings because human beings decide what happens in the application. As such
* you will have challenges with localisation & translations
* documentation has to be adjusted to the expertise of the audience (ie. beginner, advanced, expert) 
* relevance & clarity is much more important than precision (ie. the human can handle typos, etc.)

There is no standardised format for the documentation but only some loose best practices that might change across country & culture. Typical documentation includes
* training videos or presentations
* user manuals, faqs, etc.
* workshops where users learn to use your product via the user interface

**Security**

We typically control access via email/pass, social logins, sms & others. As humans are part of the process
of authentication security ergonomics is important: cumbersome procedures will reduce coversion & retention

**What we optimise**

* onboarding: improve onboarding journey to increase conversion
* localisation: localised & translated content as users interract with the interface directly
* personalisation: each user persona might have a slightly different experience (based on their profile, preferences, permissions and role in the team/organisation) 
* usability: each "screen" is made as user friendly as possible (affordances, etc.)


## 2. API - consumed by software

**Audience**

API's are consumed by other software products that push or pull data (or perform) actions via some URL's or TCP/IP socukets. 

The experience is turn based: other external system calls us, we respond, then they call again, etc.
The entire process is optimised for efficiency & high bandwith data transfers.

Most of the time the interface is the same for everyone (even if some api endpoints might have access or data restrictions associated with them). Localisation & translation is typically not required as the consuming system can always "translate" the data to the end user/system after consumption.

**Documentation**

The documentation is designed to be consumed first by machines & secondly by humans (ie. the developpers)
The machine side of the documentation has to be absolutely precise (ie. think of openapi specs used to generate clients).

**Security**

We control access via API tokens or other machine readable stuff. The security ergonomics not so important as the integration is made only once by the developpers.

**What we optimise**

* data transfer efficiency (ie. low overhead encoding protocols)
* ease of integration (ie. adequate endpoints, ecosystem focused endpoints)
* building up the ecosystem of systems that use the API (ie. partnerships etc.)

## 3. MCP - consumer by AI Agents

**Audience**

The audience are intelligent agents & various systems that can operate with mostly free / less structured text data. The agent communicates with the app via machine protocols like MCP (or similar). The interface is the same for everyone with little concern for translations and localisation (as many LLMs can handle multiple languages in the same context).

The data provided is ptimised for expliciteness & clarity (as LLMs benefit of this) and much less concern for precisions (ie. as LLM's can handle typos, etc.).

**Documentation**

The interface is self documenting and typically unified: there is a single documentation for humans & machines (with maybe small differences). This means we can reuse the text based documentation we already made for people and the LLM can mostly handle it.

**Security**
We handle security with token based access like for APIs. As LLM's are not deterministic we need to provide additional guardrails around the interraction.

**What we optimise**
* terminal like interface (ie. like a CLI) - we don't expose all API functionality in an MCP but only a rather small subset
* the ecosystem is as important as for the APis


## A practical example / scenario
Let's assume we are building a todo app. The app has 3 main areas (each with it's own features & use cases)
- user - users that do the work
- tasks - the work assigned to a user
- task templates - prefills a new task properties based on template provided values

Each "area" of the app is exposed differently depending on the consumer.

**User**
- GUI - all features for creating managing and deleting users
- API - same as the GUI
- MCP - only user list (as we don't expect the agent to create, update, delete users)

**Tasks**
- GUI - all featues
- API - all features
- MCP - only list, create and update (non-destructive)

**Task templates**
- GUI - all features
- API - none (we expect the templates to be defined via the GUI)
- MCP - no feature (we don't expect the agent to manage task templates)

In the above example the GUI interface has the most extensive set of features. The API has only some features as we don't expect partners to need to do all things via the API.
And finally it has a minimal MCP interface as any agent system will be allowed a small amount of interraction with the system (mostly non destructive work that we also know we can rollback using a audit log trail).

For each interface we create a different kind of documentation
* GUI - a series of video walkthroughs showing the main use cases; the videos have voice overs in different languages
* API - an open spec description & an automated generated UI to explore the documentation + automatically generated SDk clients for major ecosystems; this is english only
* MCP - a couple MCP endpoints documented for machine use with Markdown; english only

Each of the three interfaces has it's own product & development roadmap. Each of them has it's own target audience with distinct needs and priorities.

When we plan the roadmap we start with the GUI and we can test Product Market Fit. Once we have enough confidence that it's a good fit we continue with the API & later with the MCP (or viceversa). This way we could say that the roadmap is "human first". 

## Conclusion

Different kinds of products have different priorities. So it's perfectly possible to have a system that exposes only one interface or any combination of the 3.

Each interface & audience has to be treated on it's own value & expectations. All 3 share the same core underneath but they expose it in a way that matches what that specific audience needs (and not more)


## References
* [Model Context Protocol](https://modelcontextprotocol.io/introduction)
* [Open API Specification](https://en.wikipedia.org/wiki/OpenAPI_Specification)