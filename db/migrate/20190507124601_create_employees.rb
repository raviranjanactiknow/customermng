class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.text :address
      t.integer :base_salary
      t.string :phone_number

      t.timestamps
    end
  end
end
