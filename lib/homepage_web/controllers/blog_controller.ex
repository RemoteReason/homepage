defmodule HomepageWeb.BlogController do
  use HomepageWeb, :controller

  @layout :blog

  alias Homepage.Blog

  def index(conn, _params) do
    conn
    |> put_layout(html: @layout)
    |> render("index.html", posts: Blog.all_posts())
  end

  def show(conn, %{"id" => id}) do
    conn
    |> put_layout(html: @layout)
    |> render("show.html", post: Blog.get_post_by_id!(id))
  end
end
