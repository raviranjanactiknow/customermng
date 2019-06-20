class Department < ApplicationRecord
  has_many :employees
  validates :name, presence: :true ,format: {with: /[a-zA-Z]/},on: :create
  validates :name, presence: :true ,format: {with: /[a-zA-Z]/},on: :update
  validates_uniqueness_of :name ,on: :create
end
