class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :category
  validates :product_name, :quantity_per_unit,:unit_price,:category_id,:supplier_id,:unit_in_stock,:recorder_level, presence: true ,on: :create
  validates :product_name, :quantity_per_unit,:unit_price,:unit_in_stock,:recorder_level, presence: true ,on: :update
end
