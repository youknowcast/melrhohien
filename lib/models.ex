defmodule Melrhohien.Models do

  import Ecto.Query
  alias Melrhohien.Repo

  alias Melrhohien.Models.Image
  alias Melrhohien.Models.ImageTag
  alias Melrhohien.Models.Tag

  def get_images do
    Repo.all(Image)
  end
end