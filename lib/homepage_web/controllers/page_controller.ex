defmodule HomepageWeb.PageController do
  use HomepageWeb, :controller

  alias HomepageWeb.HomepagePageData
  @layout :app

  @default_page :what_we_do

  def index(conn, %{"page_name" => "clients"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:clients, page_data: HomepagePageData.page_data().clients)
  end

  def index(conn, %{"page_name" => "cases"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:cases, page_data: HomepagePageData.page_data().cases)
  end

  def index(conn, %{"page_name" => "nativedsd"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:nativedsd, page_data: HomepagePageData.page_data().nativedsd)
  end

  def index(conn, %{"page_name" => "signetta"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:signetta, page_data: HomepagePageData.page_data().signetta)
  end

  def index(conn, %{"page_name" => "fontdue"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:fontdue, page_data: HomepagePageData.page_data().fontdue)
  end

  def index(conn, %{"page_name" => "burohelp"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:burohelp, page_data: HomepagePageData.page_data().burohelp)
  end

  def index(conn, %{"page_name" => "lets_talk"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:lets_talk, page_data: HomepagePageData.page_data().lets_talk)
  end

  def index(conn, %{"page_name" => "ai_product_strategy"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:ai_product_strategy, page_data: HomepagePageData.page_data().ai_product_strategy)
  end

  def index(conn, %{"page_name" => "ai_go_to_market"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:ai_go_to_market, page_data: HomepagePageData.page_data().ai_go_to_market)
  end

  def index(conn, %{"page_name" => "ai_engineering"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:ai_engineering, page_data: HomepagePageData.page_data().ai_engineering)
  end

  def index(conn, %{"page_name" => "mobile_apps"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:mobile_apps, page_data: HomepagePageData.page_data().mobile_apps)
  end

  def index(conn, %{"page_name" => "web_apps"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:web_apps, page_data: HomepagePageData.page_data().web_apps)
  end

  def index(conn, %{"page_name" => "privacy_policy"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:privacy_policy, page_data: HomepagePageData.page_data().privacy_policy)
  end

  def index(conn, %{"page_name" => "cookie_policy"}) do
    conn
    |> put_layout(html: @layout)
    |> render(:cookie_policy, page_data: HomepagePageData.page_data().cookie_policy)
  end

  def index(conn, %{"page_name" => @default_page}) do
    conn
    |> put_layout(html: @layout)
    |> render(@default_page, page_data: HomepagePageData.page_data().what_we_do)
  end

  def index(conn, _) do
    conn
    |> put_layout(html: @layout)
    |> render(@default_page, page_data: HomepagePageData.page_data().what_we_do)
  end
end
