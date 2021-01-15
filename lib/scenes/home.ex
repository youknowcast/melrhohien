defmodule Melrhohien.Scene.Home do
  use Scenic.Scene
  require Logger

  alias Scenic.Graph
  alias Scenic.ViewPort

  alias Melrhohien.Models
  alias Melrhohien.Component.Nav

  import Scenic.Primitives
  import Scenic.Components

  @note """
    This is a very simple starter application.

    If you want a more full-on example, please start from:

    mix scenic.new.example
  """

  @nav_height 60
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

    start_height = 50 + @nav_height
    start_width = 50

    file_name_and_tags = Models.get_file_name_and_tags()

    png_path_and_hash = 
    file_name_and_tags
      |> Enum.map(&(hd(&1)))
      |> Enum.map(&(Path.join(@file_dir, &1)))
      |> Enum.map(&({&1, Scenic.Cache.Support.Hash.file!(&1, :sha)}))
    
    png_path_and_hash
      |> Enum.map(fn ({path, hash}) -> 
        Scenic.Cache.Static.Texture.load(path, hash) 
      end)
    
    png_specs =
    png_path_and_hash
      |> Enum.reduce([], fn({_, hash}, specs) ->
        idx = length(specs) # use as index

        # FIXME 現状，最初の 1 tag のみ対応
        tag =
        case file_name_and_tags |> Enum.at(idx) |> Enum.at(1) do
          nil -> ""
          _ -> file_name_and_tags |> Enum.at(idx) |> Enum.at(1) 
        end

        specs ++ [
          group_spec(
            [
              rect_spec(
                {180, 180},
                fill: {:image, hash},
              ),
              button_spec(
                tag, 
                id: :btn_primary, 
                theme: :primary,
                t: { 20, 190 }
              ),
            ],
            t: { start_width + length(specs) * 180, start_height }
          )
        ]
      end)
  
    graph =
      Graph.build(font: :roboto, font_size: @text_size)
      |> add_specs_to_graph(png_specs)
      |> Nav.add_to_graph(__MODULE__)

    {:ok, graph, push: graph}
  end

  def handle_input(event, _context, state) do
    Logger.info("Received event: #{inspect(event)}")
    {:noreply, state}
  end
end
