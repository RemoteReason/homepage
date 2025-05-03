defmodule HomepageWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use HomepageWeb, :html

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

  attr :title, :string, required: true
  attr :subtitle, :string, required: true
  attr :image, :string, required: true
  attr :description, :string, required: true

  def bento_large_card(assigns) do
    ~H"""
    <div class="relative lg:col-span-3">
      <div class="absolute inset-px rounded-lg bg-white max-lg:rounded-t-[2rem] lg:rounded-tl-[2rem]">
      </div>
      <div class="relative flex h-full flex-col overflow-hidden rounded-[calc(theme(borderRadius.lg)+1px)] max-lg:rounded-t-[calc(2rem+1px)] lg:rounded-tl-[calc(2rem+1px)]">
        <img class="h-80 object-cover object-left" src={@image} alt="" />
        <div class="p-10 pt-4">
          <h3 class="text-sm/4 font-semibold text-indigo-600">{@title}</h3>
          <p class="mt-2 text-lg font-medium tracking-tight text-gray-950">{@subtitle}</p>
          <p class="mt-2 max-w-lg text-sm/6 text-gray-600">{@description}</p>
        </div>
      </div>
      <div class="pointer-events-none absolute inset-px rounded-lg shadow ring-1 ring-black/5 max-lg:rounded-t-[2rem] lg:rounded-tl-[2rem]">
      </div>
    </div>
    """
  end

  attr :title, :string, required: true
  attr :subtitle, :string, required: true
  attr :image, :string, required: true
  attr :description, :string, required: true

  def bento_small_card(assigns) do
    ~H"""
    <div class="relative lg:col-span-2">
      <div class="absolute inset-px rounded-lg bg-white lg:rounded-bl-[2rem]"></div>
      <div class="relative flex h-full flex-col overflow-hidden rounded-[calc(theme(borderRadius.lg)+1px)] lg:rounded-bl-[calc(2rem+1px)]">
        <img class="h-80 object-cover object-left" src={@image} alt="" />
        <div class="p-10 pt-4">
          <h3 class="text-sm/4 font-semibold text-indigo-600">{@title}</h3>
          <p class="mt-2 text-lg font-medium tracking-tight text-gray-950">{@subtitle}</p>
          <p class="mt-2 max-w-lg text-sm/6 text-gray-600">{@description}</p>
        </div>
      </div>
      <div class="pointer-events-none absolute inset-px rounded-lg shadow ring-1 ring-black/5 lg:rounded-bl-[2rem]">
      </div>
    </div>
    """
  end
end
