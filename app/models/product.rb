class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :thumbnail, presence: true
  has_and_belongs_to_many :users
end
