defmodule HomepageWeb.LinkHelper do
  use HomepageWeb, :verified_routes

  def image_path(image) do
    Path.join("/images", image)
  end

  def blog_post_thumbnail_path(post) do
    ~p"/images/posts/#{post.date.year}/#{post.thumbnail}"
  end

  def blog_post_show(post) do
    ~p"/blog/#{post.id}"
  end

  def blog,
    do: %{
      name: "Blog",
      url: ~p"/blog"
    }

  def lets_talk,
    do: %{
      name: "Let's talk",
      url: ~p"/page/lets_talk"
    }

  def clients,
    do: %{
      name: "Clients",
      url: ~p"/page/clients"
    }

  def ai_engineering,
    do: %{
      name: "AI Engineering",
      url: ~p"/page/ai_engineering"
    }

  def what_we_do,
    do: %{
      name: "What we do",
      url: ~p"/page/what_we_do"
    }

  def web_apps,
    do: %{
      name: "Web Apps",
      url: ~p"/page/web_apps"
    }

  def mobile_apps,
    do: %{
      name: "Mobile Apps",
      url: ~p"/page/mobile_apps"
    }

  def footer_navigation do
    [
      what_we_do(),
      ai_engineering(),
      web_apps(),
      mobile_apps(),
      clients(),
      blog()
    ]
  end

  def top_navigation do
    [
      what_we_do(),
      clients(),
      blog()
    ]
  end

  def social_links do
    %{
      github: "https://github.com/RemoteReason",
      twitter: "https://twitter.com/RemoteReason",
      linkedin: "https://www.linkedin.com/company/remote-reason"
    }
  end

  def clients_list do
    client_image = fn image ->
      ~p"/images/clients/#{image}"
    end

    [
      %{
        name: "Cast Magic",
        image: client_image.("castmagic.webp"),
        description:
          "AI platform for podcasters. Turn long form audio into ready to use content assets, instantly. 10x your content. Upload your Mp3 and download transcripts, notes, summaries, highlights and more.",
        website: "castmagic.io"
      },
      %{
        name: "Burohelp",
        image: client_image.("burohelp.webp"),
        description:
          "B2B social network. Burohelp Corporate Responsability Communities connects non-profits with commercial companies that provide volunteer work on demand.",
        website: "burohelp.com"
      },
      %{
        name: "Prisma Net",
        image: client_image.("prisma.webp"),
        description:
          "PrismaNet provides care for 3 000+ people with disabilities. Services include assisted living, day activities, and family support focusing on helping people live as independently as possible.",
        website: "prismanet.nl"
      },
      %{
        name: "MIREX - República Dominicana",
        image: client_image.("dominicana.webp"),
        description:
          "Custom software solution & services delivered for the The Dominican Republic Embassy - Netherlands, The Hague.",
        website: "mirex.gob.do"
      },
      %{
        name: "Intersoft",
        image: client_image.("intersoft.webp"),
        description:
          "Intersoft delivers and supports custom-configured solutions. Remote Reason delivered for Intersoft a bespoke document signing platform for contracts at scale (ie. like DocuSign)",
        website: "intersoft.nl"
      },
      %{
        name: "Font Due",
        image: client_image.("fontdue.webp"),
        description:
          "The ecommerce platform for independent type foundries - Build your website. Manage your content. Own distribution. Sell your fonts.",
        website: "fontdue.com"
      }
    ]
  end
end
