class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :duration
      t.integer :price
      t.integer :utilities
      t.string :initial_fee
      t.string :address
      t.text :description
      t.text :amenities
      t.integer :room_mates
      t.integer :bathrooms
      t.boolean :laundry_in_unit
      t.boolean :pets_allowed
      t.boolean :four_twenty_friendly


      t.timestamps
    end
  end
end
