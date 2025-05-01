defmodule HomepageWeb.LinkHelper do
  use HomepageWeb, :verified_routes

  def blog_post_path(post) do
    ~p"/blog/#{post.id}"
  end
end
