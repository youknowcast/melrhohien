defmodule Melrhohien.Models.Image do
  @moduledoc """
  images table の Model です．
  """
  
  use Ecto.Schema

  schema "images" do
    field :file_name, :string
    timestamps()
  end
end