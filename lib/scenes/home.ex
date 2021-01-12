defmodule Melrhohien.Scene.Home do
  use Scenic.Scene
  require Logger

  alias Scenic.Graph
  alias Scenic.ViewPort

  alias Melrhohien.Models

  import Scenic.Primitives
  # import Scenic.Components

  @note """
    This is a very simple starter application.

    If you want a more full-on example, please start from:

    mix scenic.new.example
  """

  @text_size 24

  @file_dir :code.priv_dir(:melrhohien)
    |> Path.join("/static/images/") 

  # ============================================================================
  # setup

  # --------------------------------------------------------
  def init(_, opts) do
    # get the width and height of the viewport. This is to demonstrate creating
    # a transparent full-screen rectangle to catch user input
    {:ok, %ViewPort.Status{size: {width, height}}} = ViewPort.info(opts[:viewport])

    # ロードした画像の取り出し
    start_height = 50
    start_width = 50


    aa = Models.get_images()
    IO.inspect(aa)
    file_names = ["bellface_logo.jpg", "computer_cloud_system.png", "document_sekkeisyo.png", "document_shiyousyo.png", "gengou_system_reiwa.png"]

    png_path_and_hash = 
    file_names
      |> Enum.map(&(Path.join(@file_dir, &1)))
      |> Enum.map(&({&1, Scenic.Cache.Support.Hash.file!(&1, :sha)}))
    
    png_path_and_hash
      |> Enum.map(fn ({path, hash}) -> 
        Scenic.Cache.Static.Texture.load(path, hash) 
      end)
    
    png_rects =
    png_path_and_hash
      |> Enum.reduce([], fn({_, hash}, rects) ->
          rects ++ [rect_spec(
            {150, 150},
            fill: {:image, hash},
            translate: {start_width, start_height + length(rects) * 150},
          )]
        end)
    
    graph =
      Graph.build(font: :roboto, font_size: @text_size)
      |> add_specs_to_graph(png_rects)

    {:ok, graph, push: graph}
  end

  def handle_input(event, _context, state) do
    Logger.info("Received event: #{inspect(event)}")
    {:noreply, state}
  end
end
