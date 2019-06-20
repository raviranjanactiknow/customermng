class Employee < ApplicationRecord
	has_many :phone_numbers, :dependent => :destroy
	belongs_to :department
	accepts_nested_attributes_for :phone_numbers
	validates :base_salary, numericality: true
	validates :dob , :da, :ta, :sex, :department_id,:salute, presence: true
    validates :name, :address, presence: true ,format: {with: /[a-zA-Z]/},on: :create
    validates :name, :address, presence: true ,format: {with: /[a-zA-Z]/},on: :update
    validates_associated :phone_numbers
   
end
