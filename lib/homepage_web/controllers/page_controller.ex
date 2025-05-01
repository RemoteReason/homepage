defmodule HomepageWeb.PageController do
  use HomepageWeb, :controller

  @layout :app

  def index(conn, %{"page_name" => "clients"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:clients)
  end
end
