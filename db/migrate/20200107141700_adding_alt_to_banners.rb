class AddingAltToBanners < ActiveRecord::Migration[5.1]
  def change
    add_column :banners, :alt, :string
  end
end
