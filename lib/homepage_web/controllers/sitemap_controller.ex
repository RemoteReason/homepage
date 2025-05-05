defmodule HomepageWeb.SitemapController do
  alias Homepage.HomepageData
  alias Homepage.Deployment
  alias HomepageWeb.LinkHelper
  alias Homepage.Blog

  use HomepageWeb, :controller
  plug :put_layout, false

  def index(conn, _params) do
    sitemap_entry = fn url, last_mod ->
      """
      <url>
        <loc>#{url}</loc>
        <lastmod>#{Date.to_string(DateTime.to_date(last_mod))}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.5</priority>
      </url>
      """
    end

    social_links = HomepageData.social_links()

    response = """
    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    #{Enum.map(HomepageWeb.HomepagePageData.all_navigation(), &sitemap_entry.(Deployment.server_url(&1.url), DateTime.utc_now()))}
    #{Enum.map(Blog.all_posts(), &sitemap_entry.(Deployment.server_url(LinkHelper.blog_post_show(&1)), DateTime.utc_now()))}
    #{sitemap_entry.(social_links.github, DateTime.utc_now())}
    #{sitemap_entry.(social_links.twitter, DateTime.utc_now())}
    #{sitemap_entry.(social_links.linkedin, DateTime.utc_now())}
    </urlset>
    """

    conn
    |> put_resp_content_type("text/xml")
    |> send_resp(200, response)
  end
end
