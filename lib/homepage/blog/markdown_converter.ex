defmodule Homepage.Blog.MarkdownConverter do
  alias Homepage.Blog.MDExMermaid

  def convert(filepath, body, _attrs, opts) do
    if Path.extname(filepath) in [".md", ".markdown"] do
      html =
        MDEx.new()
        |> MDExMermaid.attach(mermaid_version: "11")
        |> MDEx.to_html!(
          document: body,
          extension: [
            strikethrough: true,
            tagfilter: false,
            table: true,
            autolink: false,
            tasklist: true,
            footnotes: true,
            shortcodes: true
          ]
        )

      """
      <div class="prose">
      #{html |> replace_youtube_links}
      </div>
      """
    end
  end

  def replace_youtube_links(text) do
    Regex.replace(
      ~r/youtube:\s*(https:\/\/www\.youtube\.com\/watch\?v=([\w\-]+))/,
      text,
      fn _full_match, _url, video_id ->
        """
        <iframe width="560" height="315" src="https://www.youtube.com/embed/#{video_id}" frameborder="0" allowfullscreen></iframe>
        """
      end
    )
  end

  # defp attach_mermaid(html) do
  #   """

  #   <script type="module">
  #   import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
  #   mermaid.initialize({
  #     securityLevel: 'loose',
  #     theme: 'neutral',
  #   });
  #   </script>
  #   #{html}
  #   """
  # end
end
