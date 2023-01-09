defmodule Melrhohien.Component.Nav do
  @moduledoc """
  画面ヘッダを定義します．
  """

  use Scenic.Component

  alias Scenic.ViewPort
  alias Scenic.Graph

  import Scenic.Primitives, only: [{:text, 3}, {:rect, 3}]
  import Scenic.Components

  @height 60

  # --------------------------------------------------------
  def validate(scene) when is_atom(scene), do: {:ok, scene}
  def validate({scene, _} = data) when is_atom(scene), do: {:ok, data}
  def validate(_), do: :invalid_data

  # ----------------------------------------------------------------------------
  def init(scene, _, opts) do
    styles = opts[:styles] || %{}

    graph =
      Graph.build(styles: styles, font_size: 20)
        |> rect({400, @height}, fill: {48, 48, 48})
        |> text("Saved images", translate: {64, 35}, align: :right)
        |> button("<", id: :left_pagenate_button_id, translate: {5, 10})
        |> button(">", id: :right_pagenate_button_id, translate: {1045, 10})

    scene =
      scene
      |> assign( graph: graph )
      |> push_graph( graph )

    {:ok, scene}
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
