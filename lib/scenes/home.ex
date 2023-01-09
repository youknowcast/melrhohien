defmodule Melrhohien.Scene.Home do
  @moduledoc """
  Home Scene を提供します．
  """

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

  # ============================================================================
  # setup

  # --------------------------------------------------------
  def init(scene, _, opts) do
    start_height = 50 + @nav_height
    start_width = 50

    file_name_and_tags = Models.get_file_name_and_tags()

    png_path_and_hash =
      file_name_and_tags
      |> Enum.map(&hd(&1))
      |> Enum.map(&{&1, "images/#{&1}"})

    png_specs =
      png_path_and_hash
      |> Enum.reduce([], fn {_, file}, specs ->
        # use as index
        idx = length(specs)

        # FIXME 現状，最初の 1 tag のみ対応
        tag =
          case file_name_and_tags |> Enum.at(idx) |> Enum.at(1) do
            nil -> ""
            _ -> file_name_and_tags |> Enum.at(idx) |> Enum.at(1)
          end

        specs ++
          [
            group_spec(
              [
                rect_spec(
                  {180, 180},
                  fill: {:image, file}
                ),
                button_spec(
                  tag,
                  id: :btn_primary,
                  theme: :primary,
                  t: {20, 190}
                )
              ],
              t: {start_width + length(specs) * 180, start_height}
            )
          ]
      end)

    graph =
      Graph.build(font: :roboto, font_size: @text_size)
      |> add_specs_to_graph(png_specs)
      |> Nav.add_to_graph(__MODULE__)

    scene =
      scene
      |> assign(some_state: 123, graph: graph)
      |> push_graph(graph)

    {:ok, scene}
  end

  def handle_input(event, _context, scene) do
    Logger.info("Received event: #{inspect(event)}")
    {:noreply, Scene}
  end
end
