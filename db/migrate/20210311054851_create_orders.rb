class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :phone_number,      null: false
      t.string :postal_code,       null: false
      t.integer :shipping_area_id, null: false
      t.string :city,              null: false
      t.string :address_line,      null: false
      t.string :building
      t.references :history,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
