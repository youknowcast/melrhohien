alias Melrhohien.Repo
alias Melrhohien.Models.Image
alias Melrhohien.Models.ImageTag
alias Melrhohien.Models.Tag

{:ok, img1} = %Image{file_name: "computer_cloud_system.png"} |> Repo.insert
{:ok, img2} = %Image{file_name: "document_sekkeisyo.png"} |> Repo.insert
{:ok, img3} = %Image{file_name: "document_shiyousyo.png"} |> Repo.insert
{:ok, img4} = %Image{file_name: "gengou_system_reiwa.png"} |> Repo.insert
{:ok, img5} = %Image{file_name: "computer_cloud_system.png"} |> Repo.insert
{:ok, img6} = %Image{file_name: "document_sekkeisyo.png"} |> Repo.insert
{:ok, img7} = %Image{file_name: "document_shiyousyo.png"} |> Repo.insert
{:ok, img8} = %Image{file_name: "gengou_system_reiwa.png"} |> Repo.insert
{:ok, img9} = %Image{file_name: "computer_cloud_system.png"} |> Repo.insert
{:ok, img10} = %Image{file_name: "document_sekkeisyo.png"} |> Repo.insert
{:ok, img11} = %Image{file_name: "document_shiyousyo.png"} |> Repo.insert
{:ok, img12} = %Image{file_name: "gengou_system_reiwa.png"} |> Repo.insert

{:ok, tag1} = %Tag{name: "document"} |> Repo.insert
{:ok, tag2} = %Tag{name: "system"} |> Repo.insert

# relations
%ImageTag{image_id: img1.id, tag_id: tag2.id} |> Repo.insert
%ImageTag{image_id: img2.id, tag_id: tag1.id} |> Repo.insert
%ImageTag{image_id: img3.id, tag_id: tag1.id} |> Repo.insert
%ImageTag{image_id: img4.id, tag_id: tag2.id} |> Repo.insert
