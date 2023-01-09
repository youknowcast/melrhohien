defmodule Melrhohien.Models do
  @moduledoc """
  TBD
  """

  import Ecto.Query
  alias Melrhohien.Repo

  alias Melrhohien.Models.Image
  alias Melrhohien.Models.ImageTag
  alias Melrhohien.Models.Tag

  @limit 5

  def get_file_name_and_tags(offset \\ 0) do
    from(i in Image,
      left_join: it in ImageTag,
      on: i.id == it.image_id,
      left_join: t in Tag,
      on: t.id == it.tag_id,
      select: [i.file_name, t.name],
      offset: ^offset,
      limit: @limit,
      order_by: i.inserted_at
    )
    |> Repo.all()
  end
end
