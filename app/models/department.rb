class Department < ApplicationRecord
	has_many :employees
	validates :name, presence: :true 
	validates_uniqueness_of :name ,on: :create
end
