class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :name, :price, :quantity_in_stock, presence: true
end
