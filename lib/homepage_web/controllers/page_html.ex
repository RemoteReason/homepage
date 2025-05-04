defmodule HomepageWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use HomepageWeb, :html

  import HomepageWeb.LayoutComponents
  alias Homepage.HomepageData

  embed_templates "page_html/*"

  attr :title, :string, required: true
  attr :description, :string, required: true
  attr :icon, :string, required: true

  def featured_card(assigns) do
    ~H"""
    <div class="relative pl-16">
      <dt class="text-base/7 font-semibold text-gray-900">
        <div class="absolute left-0 top-0 flex size-10 items-center justify-center rounded-lg bg-black">
          <.icon name={@icon} class="h-5 w-5 px-2 text-white" />
        </div>
        {@title}
      </dt>
      <dd class="mt-2 text-base/7 text-gray-600">
        {@description}
      </dd>
    </div>
    """
  end

  def details_features_card(assigns) do
    ~H"""
    <div class="overflow-hidden bg-white py-12 sm:py-32">
      <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <div class="mx-auto grid max-w-2xl grid-cols-1 gap-x-8 gap-y-16 sm:gap-y-20 lg:mx-0 lg:max-w-none lg:grid-cols-2">
          <div class="lg:ml-auto lg:pl-4 lg:pt-4">
            <div class="lg:max-w-lg">
              <h2 :if={assigns[:supertitle]} class="text-base/7 font-semibold text-indigo-600">
                {@supertitle}
              </h2>
              <p class="mt-2 text-pretty text-4xl font-semibold tracking-tight text-gray-900 sm:text-5xl">
                {@title}
              </p>
              <p class="mt-6 text-lg/8 text-gray-600">
                {@description}
              </p>
              <dl class="mt-10 max-w-xl space-y-8 text-base/7 text-gray-600 lg:max-w-none">
                <%= for feature <- @features do %>
                  <div class="relative pl-9">
                    <dt class="inline font-semibold text-gray-900">
                      <.icon
                        name={feature.icon_name}
                        class="absolute left-1 top-1 size-5 text-indigo-600"
                      />
                      {feature.name}
                    </dt>
                    <dd class="inline">
                      {feature.description}
                    </dd>
                  </div>
                <% end %>
              </dl>
            </div>
          </div>
          <div class="flex items-start justify-end lg:order-first">
            <img
              src={@image}
              alt="Product screenshot"
              class="w-[48rem] max-w-none rounded-xl shadow-xl ring-1 ring-gray-400/10 sm:w-[57rem]"
              width="2432"
              height="1442"
            />
          </div>
        </div>
      </div>
    </div>
    """
  end

  attr :title, :string, required: true
  attr :subtitle, :string, required: true
  attr :image, :string, required: true
  attr :description, :string, required: true

  def content_card_image_with_text(assigns) do
    ~H"""
    <img class="h-80 object-cover object-left" src={@image} alt="" />
    <div class="p-10 pt-4">
      <h3 class="text-sm/4 font-semibold text-indigo-600">{@title}</h3>
      <p class="mt-2 text-lg font-medium tracking-tight text-gray-950">{@subtitle}</p>
      <p class="mt-2 max-w-lg text-sm/6 text-gray-600">{@description}</p>
    </div>
    """
  end

  attr :title, :string, required: true
  attr :description, :string, required: true
  attr :items, :list, required: true

  def content_list_items(assigns) do
    ~H"""
    <div class="-m-2 grid grid-cols-1 rounded-[2rem] ring-1 ring-black/5 max-lg:mx-auto max-lg:w-full max-lg:max-w-md">
      <div class="grid grid-cols-1 rounded-[2rem] p-2">
        <div class="rounded-3xl bg-white p-10 pb-9">
          <h2 class="text-lg font-bold text-indigo-600">
            {@title}
          </h2>
          <p class="mt-2 text-lg/8 text-gray-600">
            {@description}
          </p>
          <div class="mt-8">
            <ul class="mt-3 space-y-3">
              <%= for item <- @items do %>
                <li class="group flex items-start gap-4 text-md/6 text-gray-600 data-[disabled]:text-gray-400">
                  <span class="inline-flex h-6 items-center">
                    <.icon name="hero-check-circle" class="h-5 w-5" />
                  </span>
                  {item}
                </li>
              <% end %>
            </ul>
          </div>
        </div>
      </div>
    </div>
    """
  end

  attr :title, :string, required: true
  attr :description, :string, required: true

  def content_page_header(assigns) do
    ~H"""
    <div class="bg-white">
      <div class="mx-auto px-6 lg:px-8">
        <div class="mx-auto max-w-2xl lg:mx-0">
          <h2 class="text-5xl font-semibold tracking-tight text-gray-900 sm:text-7xl">
            {@title}
          </h2>
          <p class="mt-8 text-pretty text-lg font-medium text-gray-500 sm:text-xl/8">
            {@description}
          </p>
        </div>
      </div>
    </div>
    """
  end
end
