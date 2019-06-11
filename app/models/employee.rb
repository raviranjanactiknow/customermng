class Employee < ApplicationRecord
	has_many :phone_numbers, :dependent => :destroy
	belongs_to :department
	accepts_nested_attributes_for :phone_numbers
    validates :name, :address,:salute,:base_salary,:da,:ta,:dob,:sex,presence: true ,on: :create
    validates :name, :address,:salute,:base_salary,:da,:ta,:dob,:sex,presence: true ,on: :update
    validates_associated :phone_numbers
   
end
