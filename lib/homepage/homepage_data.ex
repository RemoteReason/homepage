defmodule Homepage.HomepageData do
  alias Homepage.Data.ServiceDelivery
  alias Homepage.Data.ServiceDeliveryFeature
  alias Homepage.Data.ServiceDeliveryActivity

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
          name: "AI API integration",
          description:
            "We integrate your software with private AI deployments or AI service providers like OpenAI or Midjourney (and many others).",
          items: [
            "Custom AI model deployments",
            "On premise & private clouds",
            "Performance tuning & cost control"
          ]
        },
        %ServiceDeliveryActivity{
          name: "AI API integration",
          description:
            "We integrate your software with private AI deployments or AI service providers like OpenAI or Midjourney (and many others).",
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
          name: "Testable",
          icon_name: "hero-list-bullet",
          description:
            "The AI system is automatically tested with adequate evals based on human & AI feedback."
        },
        %ServiceDeliveryFeature{
          name: "Compliant",
          icon_name: "hero-check-badge",
          description:
            "The AI system is compliant with your company policies, brand guidelines & data protection regulations."
        },
        %ServiceDeliveryFeature{
          name: "Performant",
          icon_name: "hero-bolt",
          description:
            "The AI service performs as expected. Infrastructure automatically grows to handle additional load."
        },
        %ServiceDeliveryFeature{
          name: "Secure",
          icon_name: "hero-shield-check",
          description:
            "The AI system & data is completely safe. Everything stays inside your company private infrastructure or within the boundaries of trusted suppliers."
        }
      ]
    }
end
