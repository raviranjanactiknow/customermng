class AddColumnToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :da, :integer
    add_column :employees, :ta, :integer
    add_column :employees, :dob, :date
  end
end
