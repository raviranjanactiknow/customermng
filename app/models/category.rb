class Category < ApplicationRecord
	has_many :products
	validates :category_name, :description,format: {with: /[a-zA-Z]/}, presence: true ,on: :create
	validates :category_name, :description,format: {with: /[a-zA-Z]/}, presence: true ,on: :update
end
