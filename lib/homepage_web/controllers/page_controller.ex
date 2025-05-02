defmodule HomepageWeb.PageController do
  use HomepageWeb, :controller

  @layout :app

  def index(conn, %{"page_name" => "clients"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:clients)
  end

  def index(conn, %{"page_name" => "lets_talk"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:lets_talk)
  end

  def index(conn, _) do
    conn
    |> put_layout(html: @layout)
    |> render(:home)
  end
end
