defmodule Melrhohien.Models.Tag do
  @moduledoc """
  tags table の Model です．
  """

  use Ecto.Schema
  
  schema "tags" do
    field :name, :string
    timestamps()
  end
end