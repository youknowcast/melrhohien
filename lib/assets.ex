defmodule Melrhohien.Assets do
  use Scenic.Assets.Static,
    otp_app: :melrhohien,
    alias: [
      bellface_logo: "images/bellface_logo.jpg",
      computer_cloud_system: "images/computer_cloud_system.png",
      document_sekkeisyo: "images/document_sekkeisyo.png",
      document_siyousyo: "images/document_siyousyo.png",
      gengou_system_reiwa: "images/gengou_system_reiwa.png"
    ]
end
