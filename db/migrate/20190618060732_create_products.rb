class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :quantity_per_unit
      t.decimal :unit_price, precision: 10, scale: 3
      t.integer :unit_in_stock
      t.integer :recorder_level
      t.references :supplier, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
