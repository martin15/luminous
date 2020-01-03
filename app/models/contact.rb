class Contact < ApplicationRecord
  validates :name, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true
  validates :content, :presence => true
end
