class Product < ApplicationRecord
  has_permalink :name, :update => true
  mount_uploader :image, ProductImageUploader

  validates_presence_of :image
  validates :name, presence: true

  def get_image(size)
    img = self.image
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return self.image.url(size.to_sym)
    end
  end
end
