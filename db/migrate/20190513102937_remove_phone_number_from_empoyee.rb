class RemovePhoneNumberFromEmpoyee < ActiveRecord::Migration[5.2]
  def change
  	remove_column :employees, :phone_number
  end
end
