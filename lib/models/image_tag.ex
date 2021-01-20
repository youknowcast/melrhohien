defmodule Melrhohien.Models.ImageTag do
  @moduledoc """
  image_tags table の Model を提供します．
  """

  use Ecto.Schema
  alias Melrhohien.Image
  alias Melrhohien.Tag

  schema "image_tags" do
    belongs_to :image, Image
    belongs_to :tag, Tag
    timestamps()
  end
end