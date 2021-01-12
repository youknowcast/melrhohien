defmodule Melrhohien.Repo.Migrations.CreateImageTags do
  use Ecto.Migration

  def change do
    create table(:image_tags) do
      add :image_id, references(:images)
      add :tag_id, references(:tags)
      timestamps()
    end
  end
end
