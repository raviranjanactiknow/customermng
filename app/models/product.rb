class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :category
  validates :recorder_level,:quantity_per_unit, :unit_in_stock, :unit_price, numericality: true
  validates :product_name, :category_id,:supplier_id, presence: true ,format: {with: /[a-zA-Z]/},on: :create
  validates :product_name, presence: true ,format: {with: /[a-zA-Z]/},on: :update
end
