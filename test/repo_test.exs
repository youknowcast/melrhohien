defmodule RepoTest do
  use ExUnit.Case

  alias Melrhohien.Repo
  alias Melrhohien.Models.Image
  alias Melrhohien.Models.Tag
  alias Melrhohien.Models.ImageTag

  describe "get_file_name_and_tags" do
    setup do
      {:ok, file} = Repo.insert(%Melrhohien.Models.Image{file_name: "computer_cloud_system.png"})
      {:ok, tag1} = Repo.insert(%Melrhohien.Models.Tag{name: "computer_cloud_system"})
      Repo.insert(%Melrhohien.Models.ImageTag{image_id: file.id, tag_id: tag1.id})

      on_exit(fn ->
        Repo.delete_all(ImageTag)
        Repo.delete_all(Image)
        Repo.delete_all(Tag)
      end)
      %{}
    end

    test "returns file_name and name" do
      records = Melrhohien.Models.get_file_name_and_tags()
      assert(records == [
        ["computer_cloud_system.png", "computer_cloud_system"]
      ])
    end
  end

end