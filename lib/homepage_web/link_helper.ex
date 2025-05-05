defmodule HomepageWeb.LinkHelper do
  use HomepageWeb, :verified_routes

  alias Homepage.Deployment

  def image_path(image) do
    Path.join("/images", image)
  end

  def blog_post_thumbnail_path(post) do
    Deployment.server_url(~p"/images/posts/#{post.date.year}/#{post.thumbnail}")
  end

  def blog_post_show(post) do
    Deployment.server_url(~p"/blog/#{post.id}")
  end
end
