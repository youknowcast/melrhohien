defmodule Melrhohien.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :file_name, :string
      timestamps()
    end
  end
end
