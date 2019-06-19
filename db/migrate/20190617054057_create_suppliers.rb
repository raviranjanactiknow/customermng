class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :contact_name
      t.text :address
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
