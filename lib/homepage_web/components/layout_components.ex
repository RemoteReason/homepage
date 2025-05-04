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
end
