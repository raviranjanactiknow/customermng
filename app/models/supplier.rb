 class Supplier < ApplicationRecord
   has_many :products
   validates :phone, :postal_code,numericality: true
   validates :company_name, :contact_name,:address,:city,:region,:country, presence: true ,format: {with: /[a-zA-Z]/},on: :create
   validates :company_name, :contact_name,:address,:city,:region,:country, presence: true ,format: {with: /[a-zA-Z]/},on: :update
 end
