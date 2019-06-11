class AddSaluteToEmployees < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :salute, :string
  end
end
