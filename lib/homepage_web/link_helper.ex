defmodule HomepageWeb.LinkHelper do
  use HomepageWeb, :verified_routes

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

  def footer_navigation do
    [
      what_we_do(),
      ai_engineering(),
      web_apps(),
      mobile_apps(),
      clients(),
      blog()
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
end
