defmodule HomepageWeb.LinkHelper do
  use HomepageWeb, :verified_routes

  alias Homepage.Deployment

  def image_path(image) do
    Path.join("/images", image)
  end

  def blog_post_thumbnail_path(post) do
    ~p"/images/posts/#{post.date.year}/#{post.thumbnail}"
  end

  def blog_post_show(post) do
    ~p"/blog/#{post.id}"
  end

  def blog,
    do: %{
      name: "Blog",
      url: ~p"/blog"
    }

  def lets_talk,
    do: %{
      name: "Let's talk",
      url: ~p"/page/lets_talk"
    }

  def clients,
    do: %{
      name: "Clients",
      url: ~p"/page/clients"
    }

  def ai_engineering,
    do: %{
      name: "AI Engineering",
      url: ~p"/page/ai_engineering"
    }

  def what_we_do,
    do: %{
      name: "What we do",
      url: ~p"/page/what_we_do"
    }

  def web_apps,
    do: %{
      name: "Web Apps",
      url: ~p"/page/web_apps"
    }

  def mobile_apps,
    do: %{
      name: "Mobile Apps",
      url: ~p"/page/mobile_apps"
    }

  def privacy_policy,
    do: %{
      name: "Privacy Policy",
      url: ~p"/page/privacy_policy"
    }

  def cookie_policy,
    do: %{
      name: "Cookie Policy",
      url: ~p"/page/cookie_policy"
    }

  def footer_navigation do
    [
      what_we_do(),
      ai_engineering(),
      web_apps(),
      mobile_apps(),
      clients(),
      blog(),
      privacy_policy(),
      cookie_policy()
    ]
  end

  def top_navigation do
    [
      what_we_do(),
      clients(),
      blog()
    ]
  end

  def all_navigation do
    [
      what_we_do(),
      ai_engineering(),
      web_apps(),
      mobile_apps(),
      clients(),
      blog()
    ]
  end

  def get_page_site_open_graph(page_name) do
    site_title = "Remote Reason - #{page_name}"

    site_description =
      "Remote Reason is a software development company that builds custom software solutions for businesses."

    %{
      og: %{
        url: "https://remotereason.com",
        locale: "en",
        title: site_title,
        description: site_description,
        type: "website",
        image_url: Deployment.asset_url("/images/socials/facebook_social_meta.png"),
        image_alt: site_description
      },
      twitter_x: %{
        title: site_title,
        description: site_description,
        image_url: Deployment.asset_url("/images/socials/twitter_social_meta.png"),
        image_alt: site_description,
        site: "@RemoteReason",
        card: "summary_large_image"
      }
    }
  end

  def get_blog_post_site_open_graph(post) do
    %{
      og: %{
        url: "https://remotereason.com",
        locale: "en",
        title: post.title,
        description: post.description,
        type: "website",
        image_url: blog_post_thumbnail_path(post),
        image_alt: post.description
      },
      twitter_x: %{
        title: post.title,
        description: post.description,
        image_url: blog_post_thumbnail_path(post),
        image_alt: post.description,
        site: "@RemoteReason",
        card: "summary_large_image"
      }
    }
  end
end
