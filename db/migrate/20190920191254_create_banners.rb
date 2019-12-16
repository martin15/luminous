class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string  :image
      t.string  :url
      t.string  :banner_type
      t.timestamps
    end
  end
end
