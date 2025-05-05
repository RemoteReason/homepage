defmodule HomepageWeb.PageController do
  use HomepageWeb, :controller

  alias HomepageWeb.LinkHelper

  @layout :app

  @default_page :what_we_do

  def index(conn, %{"page_name" => "clients"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:clients, meta_tags: LinkHelper.get_page_site_open_graph("clients"))
  end

  def index(conn, %{"page_name" => "lets_talk"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:lets_talk, meta_tags: LinkHelper.get_page_site_open_graph("lets_talk"))
  end

  def index(conn, %{"page_name" => "ai_engineering"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:ai_engineering, meta_tags: LinkHelper.get_page_site_open_graph("ai_engineering"))
  end

  def index(conn, %{"page_name" => "mobile_apps"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:mobile_apps, meta_tags: LinkHelper.get_page_site_open_graph("mobile_apps"))
  end

  def index(conn, %{"page_name" => "web_apps"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:web_apps, meta_tags: LinkHelper.get_page_site_open_graph("web_apps"))
  end

  def index(conn, %{"page_name" => "privacy_policy"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:privacy_policy, meta_tags: LinkHelper.get_page_site_open_graph("privacy_policy"))
  end

  def index(conn, %{"page_name" => "cookie_policy"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:cookie_policy, meta_tags: LinkHelper.get_page_site_open_graph("cookie_policy"))
  end

  def index(conn, %{"page_name" => @default_page}) do
    conn
    |> put_layout(html: @layout)
    |> render(@default_page, meta_tags: LinkHelper.get_page_site_open_graph(@default_page))
  end

  def index(conn, _) do
    conn
    |> put_layout(html: @layout)
    |> render(@default_page, meta_tags: LinkHelper.get_page_site_open_graph(@default_page))
  end
end
