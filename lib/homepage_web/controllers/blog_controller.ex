defmodule HomepageWeb.BlogController do
  use HomepageWeb, :controller

  @layout :blog

  alias Homepage.Blog
  alias HomepageWeb.LinkHelper

  def index(conn, _params) do
    conn
    |> put_layout(html: @layout)
    |> render("index.html",
      posts: Blog.all_posts(),
      meta_tags: LinkHelper.get_page_site_open_graph("blog")
    )
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post_by_id!(id)

    conn
    |> put_layout(html: @layout)
    |> render("show.html",
      post: post,
      meta_tags: LinkHelper.get_blog_post_site_open_graph(post)
    )
  end
end
