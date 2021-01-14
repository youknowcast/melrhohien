defmodule Melrhohien.Models do

  import Ecto.Query
  alias Melrhohien.Repo

  alias Melrhohien.Models.Image
  alias Melrhohien.Models.ImageTag
  alias Melrhohien.Models.Tag

  @limit 5

  def get_file_name_and_tags_by_file_name(offset \\ 0) do
    (from t in Tag,
      join: it in  ImageTag,
      on: t.id == it.tag_id,
      join: i in Image,
      on: i.id == it.image_id,
      select: [i.file_name, t.name],
      offset: ^offset,
      limit: @limit,
      order_by: i.inserted_at)
      |> Repo.all
  end
end