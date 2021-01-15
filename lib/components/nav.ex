defmodule Melrhohien.Component.Nav do
  use Scenic.Component

  alias Scenic.ViewPort
  alias Scenic.Graph

  import Scenic.Primitives, only: [{:text, 3}, {:rect, 3}]
  import Scenic.Components

  # import IEx

  @height 60

  # --------------------------------------------------------
  def verify(scene) when is_atom(scene), do: {:ok, scene}
  def verify({scene, _} = data) when is_atom(scene), do: {:ok, data}
  def verify(_), do: :invalid_data

  # ----------------------------------------------------------------------------
  def init(current_scene, opts) do
    styles = opts[:styles] || %{}

    # Get the viewport width
    {:ok, %ViewPort.Status{size: {width, _}}} =
      opts[:viewport]
      |> ViewPort.info()

    graph =
      Graph.build(styles: styles, font_size: 20)
        |> rect({width, @height}, fill: {48, 48, 48})
        |> text("Saved images", translate: {64, 35}, align: :right)
        |> button("<", id: :left_pagenate_button_id, translate: {5, 10})
        |> button(">", id: :right_pagenate_button_id, translate: {1045, 10})

    {:ok, %{graph: graph, viewport: opts[:viewport]}, push: graph}
  end

  # ----------------------------------------------------------------------------
  def filter_event({:click, :left_pagenate_button_id}, _, %{viewport: vp} = state) do
    {:halt, state}
  end

  # ----------------------------------------------------------------------------
  def filter_event({:click, :right_pagenate_button_id}, _, %{viewport: vp} = state) do
    {:halt, state}
  end
end
