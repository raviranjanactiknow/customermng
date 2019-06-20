class Category < ApplicationRecord
	has_many :products
	validates :category_name, :description, presence: true ,on: :create
	validates :category_name, :description, presence: true ,on: :update
end
