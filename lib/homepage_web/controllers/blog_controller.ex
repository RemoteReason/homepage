defmodule HomepageWeb.BlogController do
  use HomepageWeb, :controller

  @layout :blog

  alias Homepage.Blog
  alias HomepageWeb.HomepagePageData

  def index(conn, _params) do
    conn
    |> put_layout(html: @layout)
    |> render("index.html",
      posts: Blog.all_posts(),
      page_data: HomepagePageData.page_data().blog
    )
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post_by_id!(id)

    conn
    |> put_layout(html: @layout)
    |> render("show.html",
      post: post,
      page_data: HomepagePageData.blog_post_data(post)
    )
  end
end
