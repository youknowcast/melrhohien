defmodule Melrhohien.Models.Image do
  use Ecto.Schema

  schema "images" do
    field :file_name, :string
    timestamps()
  end
end