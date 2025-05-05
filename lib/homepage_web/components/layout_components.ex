defmodule HomepageWeb.LayoutComponents do
  use HomepageWeb, :html

  attr :rows, :integer, default: 1

  def layout_bento_box(assigns) do
    ~H"""
    <div class="mt-10 grid grid-cols-1 gap-4 sm:mt-16 lg:grid-cols-6 lg:grid-rows-{@rows}">
      {render_slot(@inner_block)}
    </div>
    """
  end

  def layout_bento_box_small_container(assigns) do
    ~H"""
    <div class="relative lg:col-span-2">
      <div class="absolute inset-px rounded-lg bg-white lg:rounded-bl-[2rem]"></div>
      <div class="relative flex h-full flex-col overflow-hidden rounded-[calc(theme(borderRadius.lg)+1px)] lg:rounded-bl-[calc(2rem+1px)]">
        {render_slot(@inner_block)}
      </div>
      <div class="pointer-events-none absolute inset-px rounded-lg shadow ring-1 ring-black/5 lg:rounded-bl-[2rem]">
      </div>
    </div>
    """
  end

  def layout_bento_box_large_container(assigns) do
    ~H"""
    <div class="relative lg:col-span-3">
      <div class="absolute inset-px rounded-lg bg-white max-lg:rounded-t-[2rem] lg:rounded-tl-[2rem]">
      </div>
      <div class="relative flex h-full flex-col overflow-hidden rounded-[calc(theme(borderRadius.lg)+1px)] max-lg:rounded-t-[calc(2rem+1px)] lg:rounded-tl-[calc(2rem+1px)]">
        {render_slot(@inner_block)}
      </div>
      <div class="pointer-events-none absolute inset-px rounded-lg shadow ring-1 ring-black/5 max-lg:rounded-t-[2rem] lg:rounded-tl-[2rem]">
      </div>
    </div>
    """
  end

  def layout_page_centered(assigns) do
    ~H"""
    <div class="bg-white py-12 sm:py-12">
      <div class="mx-auto max-w-2xl px-6 lg:max-w-7xl lg:px-8">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  def header_navigation(assigns) do
    ~H"""
    <header class="bg-white">
      <nav class="mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8" aria-label="Global">
        <div class="flex flex-1">
          <div class="hidden lg:flex lg:gap-x-12">
            <%= for item <- HomepageWeb.LinkHelper.top_navigation() do %>
              <.link href={item.url} class="text-sm/6 font-semibold text-gray-900">{item.name}</.link>
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
        <a href="#" class="-m-1.5 p-1.5">
          <span class="sr-only">Your Company</span>
          <img class="h-8 w-auto" src={LinkHelper.image_path("/logo.svg")} alt="" />
        </a>
        <div class="flex flex-1 justify-end">
          <a href={HomepageWeb.LinkHelper.lets_talk()} class="text-sm/6 font-semibold text-gray-900">
            Let's talk
            <span aria-hidden="true">
              <.icon name="hero-chat-bubble-left-right" class="h-5 w-5 px-2" />
            </span>
          </a>
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

  def footer_navigation(assigns) do
    ~H"""
    <footer class="bg-white">
      <div class="mx-auto max-w-7xl overflow-hidden px-6 py-10 sm:py-12 lg:px-8">
        <nav
          class="-mb-6 flex flex-wrap justify-center gap-x-12 gap-y-3 text-sm/6"
          aria-label="Footer"
        >
          <%= for item <- HomepageWeb.LinkHelper.footer_navigation() do %>
            <.link href={item.url} class="text-gray-600 hover:text-gray-900">{item.name}</.link>
          <% end %>
        </nav>
        <div class="mt-16 flex justify-center gap-x-10">
          <a
            href={Homepage.HomepageData.social_links().twitter}
            class="text-gray-600 hover:text-gray-800"
          >
            <span class="sr-only">X</span>
            <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path d="M13.6823 10.6218L20.2391 3H18.6854L12.9921 9.61788L8.44486 3H3.2002L10.0765 13.0074L3.2002 21H4.75404L10.7663 14.0113L15.5685 21H20.8131L13.6819 10.6218H13.6823ZM11.5541 13.0956L10.8574 12.0991L5.31391 4.16971H7.70053L12.1742 10.5689L12.8709 11.5655L18.6861 19.8835H16.2995L11.5541 13.096V13.0956Z" />
            </svg>
          </a>
          <a
            href={Homepage.HomepageData.social_links().github}
            class="text-gray-600 hover:text-gray-800"
          >
            <span class="sr-only">GitHub</span>
            <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path
                fill-rule="evenodd"
                d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                clip-rule="evenodd"
              />
            </svg>
          </a>
          <a
            href={Homepage.HomepageData.social_links().linkedin}
            class="text-gray-600 hover:text-gray-800"
          >
            <span class="sr-only">LinkedIn</span>
            <svg
              class="size-6"
              fill="#000000"
              height="200px"
              width="200px"
              version="1.1"
              id="Shopicons"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
              viewBox="0 0 48 48"
              xml:space="preserve"
            >
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <style type="text/css">
                  .st0{fill:none;}
                </style>

                <g>
                  <path class="st0" d="M0,0h48v48H0V0z"></path>

                  <path d="M34,4H14C8.5,4,4,8.5,4,14v20c0,5.5,4.5,10,10,10h20c5.5,0,10-4.5,10-10V14C44,8.5,39.5,4,34,4z M17,35h-4V20h4V35z M15,17 c-1.1,0-2-0.9-2-2c0-1.1,0.9-2,2-2s2,0.9,2,2C17,16.1,16.1,17,15,17z M35,35h-4v-7.5c0-2.5-1-3.6-3-3.6L24,24v11h-4V20l8-0.2 c3.4,0,7,2,7,7.6V35z">
                  </path>
                </g>
              </g>
            </svg>
          </a>
        </div>
        <p class="mt-10 text-center text-sm/6 text-gray-600">
          &copy; 2025 Remote Reason. All rights reserved.
        </p>
      </div>
    </footer>
    """
  end
end
