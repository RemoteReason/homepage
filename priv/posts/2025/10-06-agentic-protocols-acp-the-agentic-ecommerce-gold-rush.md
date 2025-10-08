%{
  title: "Agentic Protocols - MCP, A2A, ACP - The agentic e-commerce gold rush",
  thumbnail: "10-06-agentic-protocols-acp-the-agentic-ecommerce-gold-rush.png",
  author: "Paul Sabou",
  tags: ~w(llm gen_ai agentic_ecommerce),
  description: "MCP & A2A makes it easier to build and compose agents. ACP makes all of them earn more money for their bosses. The old human oriented web was financed by ads. The new agent based web is financed by e-commerce."
}
---

## Overview
- **Protocols simplify AI integration** by reducing complexity, cost, and time, creating a shared technical and commercial language.
    
- **History repeats:** just like SQL standardized databases, AI systems are now moving from fragmented custom integrations to shared protocols—only much faster.
    
- **MCP (Model Context Protocol)** standardizes how AI agents use external tools, enabling reusable, interoperable tool ecosystems.
    
- **A2A (Agent-to-Agent Protocol)** defines how agents communicate and collaborate, allowing cross-organization, multi-agent teamwork.
    
- **ACP (Agentic Commerce Protocol)** standardizes e-commerce interactions in chat, enabling in-conversation shopping and monetization for AI agents.

## Protocols - MCP, A2A & ACP
Protocols reduce the cost & time for creating and maintaining integrations. 
For technical teams they reduce complexity and provide a shared domain language.
Commercial & technical teams love protocols as they bring value on both sides.

Since 2021 we integrated more and more of our products with a growing AI ecosystem of LLM's, databases and external tools. Each of these integrations were custom made & lacked a shared standard. 
## Here we go again! Just 10x faster!
This happened before in past innovation cycles : we start building things that work, we discover what brings value and then we build ecosystems. The ecosystem becomes a mess of concepts and competing proprietary standards. 

At some point the community agrees on shared standards and we created public protocols for doing things (ie. communication, data formats, etc.). 

A good example of this was the adoption of the [SQL language standards](https://en.wikipedia.org/wiki/SQL). Researchers & industry started working on SQL like languages since the early 70's. It took more than a decade for the the first standardisation effort to be adopted. Once adopted things progressed quickly with multiple SQL dialects roughly aligned with the standard.

We see the same pattern with the current AI systems but with 10x shorter timelines.
## Emerging AI standards / protocols

### MCP - a protocol for external tool use
At the ground level our AI agents use tools. A substantial amount of value delivered by an Agent is actually provided by the tools used under the hood. Examples of such tools include : external search engines, database connections, documentation sites, etc.

The agent becomes substantially more valuable not by being smarter by itself but simply by being a better tool user & having better tools in it's context.

Engineering teams invested substantial effort in providing these tools to agents. But we soon realised that each tried to expose them in a specific way and that made tool reuse impossible across codebases and organisations. When each party has it's own standard it can only use it's own tools. Sharing became a big issue. 

This building effort provided the relevant experience to standardise "tool use" with the [Model Context Protocol](https://remotereason.com/blog/design-your-app-for-humans-software-and-agents).

#### Why is MCP valuable?
With MCP we have a standard way to expose tools to the agent independent on the programming language of the tools. We achieved with MCP the same thing we did two decades ago with Open API spec for REST API's. 

Once our app implements the MCP protocol all the tools it exposes will be exposed (and will look) the same to the agent. This unlocks an important benefit - I can bring to my agent tools made by others (even closed source). These tools can be hosted in my own codebase, infrastructure or even a third party deployment provided by a third party (ie. an external tool). The agent doesn't care as all tools have exactly the same format.

MCP makes possible a large public ecosystem (both open source and proprietary) where all tools look the same and can be easily reused. Because of MCP now we have public repos with thousands of tools (for example [mcpRepo](https://www.mcp-repository.com/) or [mcpSO](https://mcp.so/)). Everyone benefits.
### A2A - a protocol for agent team work
Agentic systems often use several independent agents that work together in a team. Each agent has it's own internal state & uses it's own tools. 

But agents can be organised in a team. As a team they work directly with a central "boss agent" (ie. the team leader / coordinator) or with each other in some structure (ie. everyone with everyone, hierarchical, pairs, etc.). The team receives a common objective and they collaborate with each other to make sure the team reaches the objective.

Agents that belong to a team don't need to be part of the same organisation. Team members can belong to different organisations and developed with different frameworks & languages.

Because agents are not under the control of a single organisation they are unavoidably very diverse. That's good for the ecosystem but definitely bad for working together in a reliable way.

The experience of building collaborating agents made obvious that we need to standardise how agents present themselves (ie. their capabilities/skills) and also how to communicate with them.

The solution to this was the creation of the [A2A Protocol](https://www.oreilly.com/radar/designing-collaborative-multi-agent-systems-with-the-a2a-protocol/) (Agent to Agent Protocol) which brings a standardised format that allows agent to publish it's capabilities and communication endpoints in a machine readable format.

#### Why is A2A valuable?
This way agents can discover automatically how to communicate with each other securely and also when is the right moment to do so (ie. only when the capabilities of the other agent are needed).

A2A protocol makes possible a public ecosystem of agents whose capabilities can be reused across teams & inside / outside organisational boundaries. 

## Vertical specific agent protocols

A2A protocols allow agents to talk with each other and MCP allows a single agent to use tools in it's toolbox. Both these protocols are quite generic and apply to any vertical. We can use MCP & A2A to solve problems in the financial, e-commerce, data analytics and other verticals. They are general purpose strategies that gives us a bit of structure but forces us to provide lot's of specific details.

Some verticals have such a large TAM that it was worth creating agentic protocols that are domain specific. The market size for e-commerce was [~7 Trillion in 2024](https://www.sellerscommerce.com/blog/largest-ecommerce-markets/#:~:text=With%202.77%20billion%20people%2C%20or,the%20demographics%20of%20each%20market.)  so it makes perfect sense that we created a specific e-commerce agentic protocol. 

The protocol is called [Agentic Commerce Protocol](https://www.agenticcommerce.dev/) (ACP) and opens up a full fledged shopping experience in chat bots. Basically consumers can shop directly in their chat conversation (ie. add to basket, checkout & payment). To make this possible the ACP standardises how e-commerce operators must publish product feeds, provide checkout & payment endpoints. Once the ACP protocol is implemented on the e-commerce side they can integrate with any major chatbot operator that supports ACP. 

Right now (Oct 2025) [OpenAI](https://developers.openai.com/commerce/) is the only chatbot operator that supports ACP fully (as it was developed by OpenAI and Stripe and released with Shopify & Etsy as early adopters). 

#### Why is ACP valuable?
With ACP the e-commerce ecosystem can be plugged directly into any agentic ecosystem. Agents can build up a database of available products from merchants in the ecosystem & guide shoppers directly in the conversation. 

This unlocks additional value for any agent (or agent team) as it can generate revenue to it's operator via commissions.

MCP & A2A makes it easier to build and compose agents. ACP makes all of them earn more money for their bosses. The old human oriented web was financed by ads. The new agent based web is financed by e-commerce. 


## References
* [Model Context Protocol](https://modelcontextprotocol.io/introduction)
* [Agentic Commerce Protocol](https://www.agenticcommerce.dev/)
* [A2A Protocol](https://www.oreilly.com/radar/designing-collaborative-multi-agent-systems-with-the-a2a-protocol/)