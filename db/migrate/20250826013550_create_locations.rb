class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.references :owner, foreign_key: { to_table: :users }, null: true
      t.string :name
      t.string :category
      t.string :address
      t.string :city
      t.string :prefecture
      t.string :postal_code
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :website
      t.string :phone
      t.string :source

      t.timestamps
    end
  end
end
