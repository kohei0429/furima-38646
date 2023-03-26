class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string :postcode,             null: false
      t.integer :shipping_area_id,    null: false
      t.string :city,                 null: false
      t.string :city_number,          null: false
      t.string :building_name
      t.string :phone_number,         null: false
      t.references :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
