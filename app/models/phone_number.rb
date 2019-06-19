class PhoneNumber < ApplicationRecord
  belongs_to :employee
  belongs_to :supplier
end
