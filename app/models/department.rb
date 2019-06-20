class Department < ApplicationRecord
  has_many :employees
  validates :name, presence: :true ,on: :create
  validates :name, presence: :true ,on: :update
  validates_uniqueness_of :name ,on: :create
end
