class CreateLocationAmenities < ActiveRecord::Migration[7.1]
  def change
    create_table :location_amenities do |t|
      t.references :location, null: false, foreign_key: true
      t.references :amenity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
