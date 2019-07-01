class Customer < ApplicationRecord
   validates :contact_name, :company_name,:contact_title,:city,:region,:country,:address, presence: true ,format: {with: /[a-zA-Z]/},on: :create
   validates :contact_name, :company_name,:contact_title,:city,:region,:country,:address, presence: true ,format: {with: /[a-zA-Z]/},on: :update

   validates :phone,:fax,:postal_code,presence: :true
end
