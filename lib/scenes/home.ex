defmodule Melrhohien.Scene.Home do
  use Scenic.Scene
  require Logger

  alias Scenic.Graph
  alias Scenic.ViewPort

  import Scenic.Primitives
  # import Scenic.Components

  @note """
    This is a very simple starter application.

    If you want a more full-on example, please start from:

    mix scenic.new.example
  """

  @text_size 24

  # bellface logo
  @bellface_logo_path :code.priv_dir(:melrhohien)
  |> Path.join("/static/images/bellface_logo.jpg")
  @bellface_logo_hash Scenic.Cache.Support.Hash.file!(@bellface_logo_path, :sha)
  @bellface_logo_width 1070
  @bellface_logo_height 450

  # ============================================================================
  # setup

  # --------------------------------------------------------
  def init(_, opts) do
    # get the width and height of the viewport. This is to demonstrate creating
    # a transparent full-screen rectangle to catch user input
    {:ok, %ViewPort.Status{size: {width, height}}} = ViewPort.info(opts[:viewport])

    # sample に従って cache
    Scenic.Cache.Static.Texture.load(@bellface_logo_path, @bellface_logo_hash)

    # show the version of scenic and the glfw driver
    scenic_ver = Application.spec(:scenic, :vsn) |> to_string()
    glfw_ver = Application.spec(:scenic_driver_glfw, :vsn) |> to_string()

    graph =
      Graph.build(font: :roboto, font_size: @text_size)
      |> add_specs_to_graph([
        rect_spec(
          {@bellface_logo_width, @bellface_logo_height},
          fill: {:image, @bellface_logo_hash},
          translate: {10, 10}),
        text_spec("we are hiring!!", translate: {450, 480}),
      ])

    {:ok, graph, push: graph}
  end

  def handle_input(event, _context, state) do
    Logger.info("Received event: #{inspect(event)}")
    {:noreply, state}
  end
end
