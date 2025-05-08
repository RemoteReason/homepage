defmodule HomepageWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use HomepageWeb, :controller` and
  `use HomepageWeb, :live_view`.
  """
  use HomepageWeb, :html

  embed_templates "layouts/*"

  # Various trackers that make sense only in prod
  if Homepage.Deployment.runtime_environment?(:prod) do
    def google_tag_manager_script_head(assigns) do
      ~H"""
      <!-- Google Tag Manager -->
      <script>
        (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','G-9XXND626J7');
      </script>
      <!-- End Google Tag Manager -->
      """
    end

    def google_tag_manager_script_body(assigns) do
      ~H"""
      <!-- Google Tag Manager (noscript) -->
      <noscript>
        <iframe
          src="https://www.googletagmanager.com/ns.html?id=G-9XXND626J7"
          height="0"
          width="0"
          style="display:none;visibility:hidden"
        >
        </iframe>
      </noscript>
      <!-- End Google Tag Manager (noscript) -->
      """
    end
  else
    def google_tag_manager_script_head(assigns), do: ~H""
    def google_tag_manager_script_body(assigns), do: ~H""
  end

  # Social media meta tags
  def social_media_share_tags(assigns) do
    ~H"""
    <meta property="og:url" content={@site_open_graph.og.url} />
    <meta property="og:locale" content={@site_open_graph.og.locale} />
    <meta property="og:title" content={@site_open_graph.og.title} />
    <meta property="og:description" content={@site_open_graph.og.description} />
    <meta property="og:type" content={@site_open_graph.og.type} />
    <meta property="og:image:alt" content={@site_open_graph.og.image_alt} />
    <meta property="og:image" content={@site_open_graph.og.image_url} />

    <meta name="twitter:title" content={@site_open_graph.twitter_x.title} />
    <meta name="twitter:description" content={@site_open_graph.twitter_x.description} />
    <meta name="twitter:image" content={@site_open_graph.twitter_x.image_url} />
    <meta name="twitter:image:alt" content={@site_open_graph.twitter_x.image_alt} />
    <meta name="twitter:site" content={@site_open_graph.twitter_x.site} />
    <meta name="twitter:card" content={@site_open_graph.twitter_x.card} />
    """
  end

  def site_header(assigns) do
    ~H"""
    <header class="bg-white">
      <nav class="mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8" aria-label="Global">
        <div class="flex flex-1">
          <div class="hidden lg:flex lg:gap-x-12">
            <%= for item <- HomepageWeb.HomepagePageData.top_navigation() do %>
              <.link href={item.url} class="text-lg font-semibold text-gray-900 font-mono">
                {item.name}
              </.link>
            <% end %>
          </div>
          <div class="flex lg:hidden">
            <button
              type="button"
              class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700"
            >
              <span class="sr-only">Open main menu</span>
              <svg
                class="size-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                aria-hidden="true"
                data-slot="icon"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
                />
              </svg>
            </button>
          </div>
        </div>
        <a href={~p"/"} class="-m-1.5 p-1.5">
          <span class="sr-only">Remote Reason</span>
          <img class="h-8 w-auto" src={LinkHelper.image_path("/logo.svg")} alt="" />
        </a>
        <div class="flex flex-1 justify-end">
          <div class="mt-10 flex items-center gap-x-6 lg:mt-0 lg:shrink-0">
            <a
              href={HomepageWeb.HomepagePageData.page_data().lets_talk.url}
              class="rounded-md bg-black px-4 py-4 text-sm font-semibold text-white shadow-sm"
            >
              Let's talk
              <span aria-hidden="true">
                <.icon name="hero-chat-bubble-left-right" class="h-5 w-5 px-2" />
              </span>
            </a>
          </div>
        </div>
      </nav>
      <!-- Mobile menu, show/hide based on menu open state. -->
      <%!-- <div class="lg:hidden" role="dialog" aria-modal="true">
    <!-- Background backdrop, show/hide based on slide-over state. -->
    <div class="fixed inset-0 z-10"></div>
    <div class="fixed inset-y-0 left-0 z-10 w-full overflow-y-auto bg-white px-6 py-6">
      <div class="flex items-center justify-between">
        <div class="flex flex-1">
          <button type="button" class="-m-2.5 rounded-md p-2.5 text-gray-700">
            <span class="sr-only">Close menu</span>
            <svg class="size-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" data-slot="icon">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <a href="#" class="-m-1.5 p-1.5">
          <span class="sr-only">Your Company</span>
          <img class="h-8 w-auto" src="https://tailwindcss.com/plus-assets/img/logos/mark.svg?color=indigo&shade=600" alt="">
        </a>
        <div class="flex flex-1 justify-end">
      <a href={HomepageWeb.LinkHelper.lets_talk()} class="text-sm/6 font-semibold text-gray-900">Let's talk
      <span aria-hidden="true">
      <.icon name="hero-chat-bubble-left-right" class="h-5 w-5 px-2" />
      </span></a>
    </div>
      </div>
      <div class="mt-6 space-y-2">
        <%= for item <- HomepageWeb.LinkHelper.top_navigation() do %>
          <.link href={item.url} class="-mx-3 block rounded-lg px-3 py-2 text-base/7 font-semibold text-gray-900 hover:bg-gray-50">{item.name}</.link>
        <% end %>

      </div>
    </div>
    </div> --%>
    </header>
    """
  end

  def footer_column(assigns) do
    ~H"""
    <div>
      <h3 class="text-sm/6 font-semibold text-gray-900 mt-4">
        {Recase.to_title(Atom.to_string(@category))}
      </h3>
      <ul role="list" class="mt-2 space-y-2">
        <%= for item <- Enum.filter(HomepageWeb.HomepagePageData.footer_navigation(), &(&1.category == @category)) do %>
          <li>
            <.link href={item.url} class="text-sm/6 text-gray-600 hover:text-gray-900">
              {item.name}
            </.link>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  def site_footer(assigns) do
    ~H"""
    <footer class="bg-white">
      <div class="mx-auto max-w-7xl px-6 pb-8 pt-16 sm:pt-24 lg:px-8 lg:pt-32">
        <div class="xl:grid xl:grid-cols-3 xl:gap-8">
          <div class="space-y-8 flex flex-col items-center">
            <img class="h-9" src={LinkHelper.image_path("/logo.svg")} alt="Company name" />
            <p class="text-balance text-sm/6 text-gray-600">
              <span class="font-mono">we build software for humans and bots</span>
            </p>
            <.site_socials />
          </div>
          <div class="mt-16 grid grid-cols-2 gap-2 xl:col-span-2 xl:mt-0">
            <div class="md:grid md:grid-cols-3 md:gap-8">
              <.footer_column category={:services} />
              <.footer_column category={:company} />
              <.footer_column category={:legal} />
            </div>
          </div>
        </div>
        <div class="mt-16 border-t border-gray-900/10 pt-8 sm:mt-20 lg:mt-24">
          <p class="text-sm/6 text-gray-600">
            &copy; {Date.utc_today().year} Remote Reason. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
    """
  end
end
