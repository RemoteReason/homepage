defmodule HomepageWeb.HomepagePageData do
  alias Homepage.HomepageData
  alias HomepageWeb.LinkHelper
  use HomepageWeb, :verified_routes

  def footer_navigation do
    [
      page_data().what_we_do,
      page_data().ai_product_strategy,
      page_data().ai_go_to_market,
      page_data().ai_engineering,
      page_data().web_apps,
      page_data().mobile_apps,
      page_data().clients,
      page_data().blog,
      page_data().privacy_policy,
      page_data().cookie_policy
    ]
  end

  def top_navigation do
    [
      page_data().what_we_do,
      page_data().clients,
      # page_data().cases,
      page_data().blog
    ]
  end

  def all_navigation do
    [
      page_data().what_we_do,
      page_data().ai_engineering,
      page_data().web_apps,
      page_data().mobile_apps,
      page_data().clients,
      page_data().cases,
      page_data().blog
    ]
  end

  def blog_post_data(post) do
    %{
      title: post.title,
      description: post.description,
      open_graph: get_blog_post_site_open_graph(post)
    }
  end

  def page_data do
    %{
      blog: %{
        category: :company,
        name: "Blog",
        url: ~p"/blog",
        title: site_title("Blog"),
        description: "Our blog",
        open_graph: get_page_site_open_graph("Blog")
      },
      lets_talk: %{
        category: :company,
        name: "Let's talk",
        url: ~p"/page/lets_talk",
        title: site_title("Let's talk"),
        description: "Let's talk about your project",
        open_graph: get_page_site_open_graph("Let's talk")
      },
      clients: %{
        category: :company,
        name: "Clients",
        url: ~p"/page/clients",
        title: site_title("Clients"),
        description: "Our clients",
        open_graph: get_page_site_open_graph("Clients")
      },
      cases: %{
        category: :company,
        name: "Cases",
        url: ~p"/page/cases",
        title: site_title("Cases"),
        description: "Cases",
        open_graph: get_page_site_open_graph("Cases")
      },
      nativedsd: %{
        category: :company,
        name: "NativeDSD",
        url: ~p"/page/nativedsd",
        title: site_title("NativeDSD"),
        description: "Nativedsd",
        open_graph: get_page_site_open_graph("NativeDSD")
      },
      signetta: %{
        category: :company,
        name: "Signetta",
        url: ~p"/page/signetta",
        title: site_title("Signetta"),
        description: "Signetta",
        open_graph: get_page_site_open_graph("Signetta")
      },
      prisma: %{
        category: :company,
        name: "Prisma Net",
        url: ~p"/page/prisma",
        title: site_title("Prisma"),
        description: "Prisma",
        open_graph: get_page_site_open_graph("Prisma")
      },
      burohelp: %{
        category: :company,
        name: "Burohelp",
        url: ~p"/page/burohelp",
        title: site_title("Burohelp"),
        description: "Burohelp",
        open_graph: get_page_site_open_graph("Burohelp")
      },
      what_we_do: %{
        category: :company,
        name: "What we do",
        url: ~p"/page/what_we_do",
        title: site_title("What we do"),
        description:
          "We are a software development company that builds custom software solutions for businesses.",
        open_graph: get_page_site_open_graph("What we do")
      },
      ai_product_strategy: %{
        category: :services,
        name: HomepageData.service_ai_product_strategy().name,
        url: ~p"/page/ai_product_strategy",
        title: site_title(HomepageData.service_ai_product_strategy().name),
        description: HomepageData.service_ai_product_strategy().description,
        open_graph:
          get_page_site_from_service_open_graph(HomepageData.service_ai_product_strategy())
      },
      ai_go_to_market: %{
        category: :services,
        name: HomepageData.service_ai_go_to_market().name,
        url: ~p"/page/ai_go_to_market",
        title: site_title(HomepageData.service_ai_go_to_market().name),
        description: HomepageData.service_ai_go_to_market().description,
        open_graph: get_page_site_from_service_open_graph(HomepageData.service_ai_go_to_market())
      },
      ai_engineering: %{
        category: :services,
        name: HomepageData.service_ai_engineering().name,
        url: ~p"/page/ai_engineering",
        title: site_title(HomepageData.service_ai_engineering().name),
        description: HomepageData.service_ai_engineering().description,
        open_graph: get_page_site_from_service_open_graph(HomepageData.service_ai_engineering())
      },
      mobile_apps: %{
        category: :services,
        name: HomepageData.service_mobile_apps().name,
        url: ~p"/page/mobile_apps",
        title: site_title(HomepageData.service_mobile_apps().name),
        description: HomepageData.service_mobile_apps().description,
        open_graph: get_page_site_from_service_open_graph(HomepageData.service_mobile_apps())
      },
      web_apps: %{
        category: :services,
        name: HomepageData.service_web_apps().name,
        url: ~p"/page/web_apps",
        title: site_title(HomepageData.service_web_apps().name),
        description: HomepageData.service_web_apps().description,
        open_graph: get_page_site_from_service_open_graph(HomepageData.service_web_apps())
      },
      privacy_policy: %{
        category: :legal,
        name: "Privacy Policy",
        url: ~p"/page/privacy_policy",
        title: site_title("Privacy Policy"),
        description: "Privacy Policy",
        open_graph: get_page_site_open_graph("Privacy Policy")
      },
      cookie_policy: %{
        category: :legal,
        name: "Cookie Policy",
        url: ~p"/page/cookie_policy",
        title: site_title("Cookie Policy"),
        description: "Cookie Policy",
        open_graph: get_page_site_open_graph("Cookie Policy")
      }
    }
  end

  def get_page_site_from_service_open_graph(service_delivery) do
    %{
      og: %{
        url: HomepageData.site().url,
        locale: "en",
        title: site_title(service_delivery.name),
        description: service_delivery.description,
        type: "website",
        image_url: LinkHelper.image_url("/website_social_card.png"),
        image_alt: service_delivery.description
      },
      twitter_x: %{
        url: HomepageData.site().url,
        title: site_title(service_delivery.name),
        description: service_delivery.description,
        image_url: LinkHelper.image_url("/website_social_card.png"),
        image_alt: service_delivery.description,
        site: HomepageData.social_links().twitter,
        card: "summary_large_image"
      }
    }
  end

  def get_page_site_open_graph(page_name) do
    site_title = site_title(page_name)

    site_description =
      "Remote Reason is a software development company that builds custom software solutions for businesses."

    %{
      og: %{
        url: HomepageData.site().url,
        locale: "en",
        title: site_title,
        description: site_description,
        type: "website",
        image_url: LinkHelper.image_url("/website_social_card.png"),
        image_alt: site_description
      },
      twitter_x: %{
        title: site_title,
        description: site_description,
        image_url: LinkHelper.image_url("/website_social_card.png"),
        image_alt: site_description,
        site: HomepageData.social_links().twitter,
        card: "summary_large_image"
      }
    }
  end

  def get_blog_post_site_open_graph(post) do
    %{
      og: %{
        url: HomepageData.site().url,
        locale: "en",
        title: post.title,
        description: post.description,
        type: "website",
        image_url: LinkHelper.blog_post_thumbnail_path(post),
        image_alt: post.description
      },
      twitter_x: %{
        title: post.title,
        description: post.description,
        image_url: LinkHelper.blog_post_thumbnail_path(post),
        image_alt: post.description,
        site: HomepageData.social_links().twitter,
        card: "summary_large_image"
      }
    }
  end

  defp site_title(page_name) do
    if is_nil(page_name) do
      HomepageData.site().title
    else
      "#{HomepageData.site().title} - #{page_name}"
    end
  end
end
