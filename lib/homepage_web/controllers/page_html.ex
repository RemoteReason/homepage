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
                        name="hero-information-circle"
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
    <img class="w-full h-80 object-cover object-left" src={@image} alt="" />
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
      <div class="mx-auto">
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

  attr :image, :string, required: true

  def container_hero_image(assigns) do
    ~H"""
    <div class="static px-0 -mr-10 -ml-10  md:m-0">
      <img src={@image} alt="Product screenshot" />
    </div>
    """
  end

  attr :alignment, :string, default: "left"
  slot :inner_block

  def container_box_large_layout(assigns) do
    ~H"""
    <%= if @alignment == "left" do %>
      <div class="flex flex-col px-6 py-6 lg:flex-row-reverse lg:space-x-16 lg:py-10 justify-between">
        {render_slot(@inner_block)}
      </div>
    <% else %>
      <div class="flex flex-col px-6 py-6 lg:flex-row lg:space-x-16 lg:py-10 justify-between">
        {render_slot(@inner_block)}
      </div>
    <% end %>
    """
  end

  attr :alignment, :string, default: "left"
  attr :title, :string, required: true
  attr :image, :string, required: true
  slot :inner_block

  def container_box_large(assigns) do
    ~H"""
    <.container_box_large_layout alignment={@alignment}>
      <div class="flex flex-col pb-6 lg:pl-8 lg:w-1/2 lg:flex-row">
        <img
          src={@image}
          alt="Product screenshot"
          class="object-contain object-left"
        />
      </div>
      <div class="flex flex-col lg:w-1/2">
        <div class="flex flex-col space-y-2 pt-6 lg:pt-0 lg:pr-8">
          <h4 class="max-w-md text-lg md:text-xl font-semibold">
            {@title}
          </h4>
          <div class="text-base/7 text-gray-700">
            {render_slot(@inner_block)}
          </div>
        </div>
      </div>
    </.container_box_large_layout>
    """
  end

  attr :title, :string, required: true
  attr :subtitle, :string, required: true
  attr :border_color, :string, default: nil

  def container_box_small(assigns) do
    ~H"""
    <div class="flex flex-col w-full text-center pb-0 md:pb-6 mx-auto md:w-1/3">
      <div class={[
        "p-6 rounded-2xl bg-white shadow-lg shadow-zinc-700/10 ring-1 ring-zinc-700/10",
        @border_color && ["border-4 border-dotted", @border_color]
      ]}>
        <h3 class="text-2xl font-semibold md:text-4xl">{@title}</h3>
        <p class="text-sm text-gray-700 font-light">{@subtitle}</p>
      </div>
    </div>
    """
  end

  attr :title, :string, required: true
  attr :description, :string, required: true

  def container_page_heading(assigns) do
    ~H"""
    <div class="flex flex-col items-center mx-auto py-6 md:flex-row md:space-x-16">
      <div class="flex flex-col items-left space-y-2 md:w-1/3 text-left">
        <h3 class="text-5xl font-semibold text-gray-900">{@title}</h3>
      </div>
      <!-- Item 2 -->
      <div class="md:space-x-12 md:w-2/3 font-light text-2xl text-gray-700 text-center md:text-right">
        <p class="text-xl">{@description}</p>
      </div>
    </div>
    """
  end

  slot :inner_block

  def container_page_box(assigns) do
    ~H"""
    <div class="px-6 pt-2 pb-8 md:pb-4">
      <div class="relative flex flex-col w-full space-y-6 md:flex-row md:space-y-0 md:space-x-12 text-base/7 text-gray-700">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  attr :title, :string, required: true
  slot :inner_block

  def container_page_text(assigns) do
    ~H"""
    <div class="container mx-auto px-6 md:pt-2">
      <h1 class="text-3xl font-semibold leading-normal py-4 text-left md:text-4xl">
        {@title}
      </h1>
      <div class="text-base/7 text-gray-700">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  slot :inner_block

  def container_page_paragraph(assigns) do
    ~H"""
    <div class="my-2.5 text-base/7 text-gray-700">
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :title, :string, required: true
  slot :inner_block

  def page_box_items(assigns) do
    ~H"""
    <div class="flex flex-col md:p-2 space-y-1 md:w-1/3">
      <h5 class="text-lg font-semibold">{@title}</h5>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :title, :string, required: false
  attr :icon, :string, default: "hero-arrow-right"
  slot :inner_block

  def container_page_paragraph_item(assigns) do
    ~H"""
    <li class="group flex items-start gap-2 md:gap-4 my-1.5 text-base/7 text-gray-700">
      <span class="inline-flex h-8 items-center">
        <.icon name={@icon} class="h-4 w-4 md:h-5 md-h5" />
      </span>
      <div>
        <p :if={assigns[:title]} class="font-semibold tracking-tight">
          {@title}
        </p>
        {render_slot(@inner_block)}
      </div>
    </li>
    """
  end

  attr :name, :string, required: true
  attr :position, :string, required: true
  attr :image, :string, required: true
  attr :description, :string, required: true
  attr :linkedin, :string, required: false
  attr :clutch, :string, required: true

  def container_page_card(assigns) do
    ~H"""
    <div class="container mx-auto p-6 mt-12 mb-20">
      <div class="relative max-w-4xl mx-auto space-y-6 rounded-lg max-lg:mx-auto max-lg:w-full max-lg:max-w-md">
        <!-- Quote -->
        <div class="flex flex-col p-6 space-y-6 rounded-lg shadow-lg">
          <p class="text-lg md:text-2xl text-gray-600 font-light">
            {@description}
          </p>
          <div class="flex space-x-4">
            <img class="w-12 h-12 rounded-full mt-2" src={@image} alt="{@name}" />
            <div class="">
              <h5 class="text-sm font-semibold">{@name}</h5>
              <p class="text-xs font-extralight">{@position}</p>
              <div class="flex flex-row space-x-4">
                
    <!-- Linkedin -->
                <a
                  :if={assigns[:linkedin]}
                  href={@linkedin}
                  target="new_page"
                  class="text-xs font-semibold block"
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
                <!-- Clutch -->
                <a
                  href={@clutch}
                  target="new_page"
                >
                  <span class="sr-only">Clutch</span>
                  <img src={HomepageWeb.LinkHelper.image_url("/clutch_logo.jpg")} class="size-6" />
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
