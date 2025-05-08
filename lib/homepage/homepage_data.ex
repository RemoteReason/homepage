defmodule Homepage.HomepageData do
  alias Homepage.Data.ServiceDelivery
  alias Homepage.Data.ServiceDeliveryFeature
  alias Homepage.Data.ServiceDeliveryActivity

  def site,
    do: %{
      title: "Remote Reason",
      description:
        "Remote Reason is a software development company that builds custom software solutions for businesses.",
      url: "https://remotereason.com"
    }

  def service_ai_product_strategy,
    do: %ServiceDelivery{
      name: "AI Strategy",
      subtitle: "Delight your customers with AI sparkles",
      description:
        "We strategically place AI features so that they help your customers and bring value to your business.",
      image: "/home/ai_strategies.svg",
      activities: [
        %ServiceDeliveryActivity{
          name: "Web frontend",
          description:
            "We build frontends with Phoenix Liveview or React with JS/TS. Tailwind or similar for CSS. Visualisations with D3 & WebGL.",
          items: ["Beautifull in all browsers", "Mobile & tablet ready", "Rich media experience"]
        },
        %ServiceDeliveryActivity{
          name: "Backend server",
          description:
            "We deliver with Phoenix/Elixir. Node with JS/TS. Scala/Java/Akka. Various SQL/noSQL databases.",
          items: [
            "Scalable & secure",
            "Ready for integrations",
            "Easy to change"
          ]
        },
        %ServiceDeliveryActivity{
          name: "DevOps",
          description:
            "We take care of CI/CD. We deploy on AWS or CGP but also on PaaS like Render or Fly. Kubernetes as well.",
          items: ["Fully automated", "Fully automated", "Cost effective"]
        }
      ],
      delivery_description: "Your web app is crafted with care for the overall business value.",
      delivery_features: [
        %ServiceDeliveryFeature{
          name: "Look & feel",
          icon_name: "hero-heart",
          description:
            "The web app looks great & feels right on all relevant screen sizes & devices."
        },
        %ServiceDeliveryFeature{
          name: "Performance",
          icon_name: "hero-bolt",
          description:
            "The web app feels fast & smooth. Infrastructure automatically grows to handle the load."
        },
        %ServiceDeliveryFeature{
          name: "Secure",
          icon_name: "hero-shield-check",
          description:
            "The user data & communication is secure. All data handling complies with relevant regulations."
        }
      ]
    }

  def service_ai_go_to_market,
    do: %ServiceDelivery{
      name: "AI GTM",
      subtitle: "Growth driven by humans & bots",
      description: "We amplify your growth team with AI integrations and automation.",
      image: "/home/ai_gtm.svg",
      activities: [
        %ServiceDeliveryActivity{
          name: "Web frontend",
          description:
            "We build frontends with Phoenix Liveview or React with JS/TS. Tailwind or similar for CSS. Visualisations with D3 & WebGL.",
          items: ["Beautifull in all browsers", "Mobile & tablet ready", "Rich media experience"]
        },
        %ServiceDeliveryActivity{
          name: "Backend server",
          description:
            "We deliver with Phoenix/Elixir. Node with JS/TS. Scala/Java/Akka. Various SQL/noSQL databases.",
          items: [
            "Scalable & secure",
            "Ready for integrations",
            "Easy to change"
          ]
        },
        %ServiceDeliveryActivity{
          name: "DevOps",
          description:
            "We take care of CI/CD. We deploy on AWS or CGP but also on PaaS like Render or Fly. Kubernetes as well.",
          items: ["Fully automated", "Fully automated", "Cost effective"]
        }
      ],
      delivery_description: "Your web app is crafted with care for the overall business value.",
      delivery_features: [
        %ServiceDeliveryFeature{
          name: "Look & feel",
          icon_name: "hero-heart",
          description:
            "The web app looks great & feels right on all relevant screen sizes & devices."
        },
        %ServiceDeliveryFeature{
          name: "Performance",
          icon_name: "hero-bolt",
          description:
            "The web app feels fast & smooth. Infrastructure automatically grows to handle the load."
        },
        %ServiceDeliveryFeature{
          name: "Secure",
          icon_name: "hero-shield-check",
          description:
            "The user data & communication is secure. All data handling complies with relevant regulations."
        }
      ]
    }

  def service_web_apps,
    do: %ServiceDelivery{
      name: "Web Apps",
      subtitle: "Frontend / Backend / DevOps",
      description:
        "We build webapps & platforms. We handle frontend, backend, devops, cloud and everything.",
      image: "/expertise/web_apps.svg",
      activities: [
        %ServiceDeliveryActivity{
          name: "Web frontend",
          description:
            "We build frontends with Phoenix Liveview or React with JS/TS. Tailwind or similar for CSS. Visualisations with D3 & WebGL.",
          items: ["Beautifull in all browsers", "Mobile & tablet ready", "Rich media experience"]
        },
        %ServiceDeliveryActivity{
          name: "Backend server",
          description:
            "We deliver with Phoenix/Elixir. Node with JS/TS. Scala/Java/Akka. Various SQL/noSQL databases.",
          items: [
            "Scalable & secure",
            "Ready for integrations",
            "Easy to change"
          ]
        },
        %ServiceDeliveryActivity{
          name: "DevOps",
          description:
            "We take care of CI/CD. We deploy on AWS or CGP but also on PaaS like Render or Fly. Kubernetes as well.",
          items: ["Fully automated", "Fully automated", "Cost effective"]
        }
      ],
      delivery_description: "Your web app is crafted with care for the overall business value.",
      delivery_features: [
        %ServiceDeliveryFeature{
          name: "Look & feel",
          icon_name: "hero-heart",
          description:
            "The web app looks great & feels right on all relevant screen sizes & devices."
        },
        %ServiceDeliveryFeature{
          name: "Performance",
          icon_name: "hero-bolt",
          description:
            "The web app feels fast & smooth. Infrastructure automatically grows to handle the load."
        },
        %ServiceDeliveryFeature{
          name: "Secure",
          icon_name: "hero-shield-check",
          description:
            "The user data & communication is secure. All data handling complies with relevant regulations."
        }
      ]
    }

  def service_mobile_apps,
    do: %ServiceDelivery{
      name: "Mobile Apps",
      subtitle: "Cross platform / iOS / Android",
      description: "We build mobile apps that work on phones, tablets, wearables & more.",
      image: "/expertise/mobile_apps.svg",
      activities: [
        %ServiceDeliveryActivity{
          name: "Cross platform",
          description:
            "Most of the code is reused when building the Android & IOS apps. Best value for most business cases.",
          items: ["Coded with React Native", "> 50% cheaper vs. native", "Good performance"]
        },
        %ServiceDeliveryActivity{
          name: "iOS Native",
          description:
            "iOS specific code runs only on Apple devices. Best for advanced hardware & OS integration.",
          items: [
            "Coded in Swift / Objective C",
            "Full OS / hardware access",
            "Maximum performance"
          ]
        },
        %ServiceDeliveryActivity{
          name: "Android Native",
          description:
            "Android specific code runs only on Android devices. Best for advanced hardware & OS integration.",
          items: ["Coded in Kotlin / Java", "Full OS / hardware access", "Maximum performance"]
        }
      ],
      delivery_description:
        "Your mobile app is crafted with care for the overall customer experience.",
      delivery_features: [
        %ServiceDeliveryFeature{
          name: "Look & feel",
          icon_name: "hero-heart",
          description: "The app looks great & feels right on all relevant screen sizes & devices."
        },
        %ServiceDeliveryFeature{
          name: "Performant",
          icon_name: "hero-bolt",
          description: "The app feels fast & smooth. Uses the right amount battery & mobile data."
        },
        %ServiceDeliveryFeature{
          name: "Secure",
          icon_name: "hero-shield-check",
          description:
            "The user data & communication is secure. All data handling complies with relevant regulations."
        }
      ]
    }

  def service_ai_engineering,
    do: %ServiceDelivery{
      name: "AI Engineering",
      subtitle: "On premise / Cloud / Saas",
      description: "We deploy, integrate & fine tune commercial and open source AI models",
      image: "/expertise/ai_engineering.svg",
      activities: [
        %ServiceDeliveryActivity{
          name: "AI API integration",
          description:
            "We integrate your software with private AI deployments or AI service providers like OpenAI or Midjourney (and many others).",
          items: [
            "AI API integration",
            "Integrate public & private data",
            "Prompt engineering"
          ]
        },
        %ServiceDeliveryActivity{
          name: "AI deployment",
          description:
            "We deploy custom AI models alongside your software. You keep full control on your business data.",
          items: [
            "Custom AI model deployments",
            "On premise & private clouds",
            "Performance tuning & cost control"
          ]
        },
        %ServiceDeliveryActivity{
          name: "AI finetuning",
          description:
            "We finetune custom or commerial AI models with your own business data. We make the AI system truly yours.",
          items: [
            "Training on private documents",
            "Finetuning LLM's with human feedback",
            "Business case specific finetuning"
          ]
        }
      ],
      delivery_description:
        "Your AI system is crafted with care for your product strategy and is aligned with your organisational goals.",
      delivery_features: [
        %ServiceDeliveryFeature{
          name: "Truly yours",
          icon_name: "hero-heart",
          description:
            "The AI system understands your own data & functions well for your specific business case."
        },
        %ServiceDeliveryFeature{
          name: "Compliant",
          icon_name: "hero-check-badge",
          description:
            "The AI system is compliant with your company policies, brand guidelines & data protection regulations."
        },
        %ServiceDeliveryFeature{
          name: "Secure",
          icon_name: "hero-shield-check",
          description:
            "The AI system & data is completely safe. Everything stays inside your company private infrastructure or within the boundaries of trusted suppliers."
        }
      ]
    }

  def social_links do
    %{
      github: "https://github.com/RemoteReason",
      twitter: "https://twitter.com/RemoteReason",
      linkedin: "https://www.linkedin.com/company/remote-reason"
    }
  end

  def clients_list do
    client_image = fn image ->
      "/clients/#{image}"
    end

    [
      %{
        name: "Cast Magic",
        image: client_image.("castmagic.webp"),
        description:
          "AI platform for podcasters. Turn long form audio into ready to use content assets, instantly. 10x your content. Upload your Mp3 and download transcripts, notes, summaries, highlights and more.",
        website: "castmagic.io",
        country_code: "US",
        location: "Austin / TX"
      },
      %{
        name: "Burohelp",
        image: client_image.("burohelp.webp"),
        description:
          "B2B social network. Burohelp Corporate Responsability Communities connects non-profits with commercial companies that provide volunteer work on demand.",
        website: "burohelp.com",
        country_code: "NL",
        location: "The Hague"
      },
      %{
        name: "Prisma Net",
        image: client_image.("prisma.webp"),
        description:
          "PrismaNet provides care for 3 000+ people with disabilities. Services include assisted living, day activities, and family support focusing on helping people live as independently as possible.",
        website: "prismanet.nl",
        country_code: "NL",
        location: "Waalwijk"
      },
      %{
        name: "MIREX - República Dominicana",
        image: client_image.("dominicana.webp"),
        description:
          "Custom software solution & services delivered for the The Dominican Republic Embassy - Netherlands, The Hague.",
        website: "mirex.gob.do",
        country_code: "NL",
        location: "The Hague"
      },
      %{
        name: "Intersoft",
        image: client_image.("intersoft.webp"),
        description:
          "Intersoft delivers and supports custom-configured solutions. Remote Reason delivered for Intersoft a bespoke document signing platform for contracts at scale (ie. like DocuSign)",
        website: "intersoft.nl",
        country_code: "FR",
        location: "Paris"
      },
      %{
        name: "Font Due",
        image: client_image.("fontdue.webp"),
        description:
          "The ecommerce platform for independent type foundries - Build your website. Manage your content. Own distribution. Sell your fonts.",
        website: "fontdue.com",
        country_code: "US",
        location: "New York / NY"
      }
    ]
  end
end
