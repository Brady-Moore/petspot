class CreateAmenities < ActiveRecord::Migration[7.1]
  def change
    create_table :amenities do |t|
      t.string :key
      t.string :label

      t.timestamps
    end
  end
end
