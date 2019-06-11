class AddDepartmentToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :department, foreign_key: true
  end
end
