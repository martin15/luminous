class Banner < ApplicationRecord
  TYPE = ["banner", "services"]
  mount_uploader :image, BannerUploader

  validates_presence_of :image
end
