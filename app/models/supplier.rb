class Supplier < ApplicationRecord
	has_many :phone_numbers
	accepts_nested_attributes_for :phone_numbers
	has_many :products
end
