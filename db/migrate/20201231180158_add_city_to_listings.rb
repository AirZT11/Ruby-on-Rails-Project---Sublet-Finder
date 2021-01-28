class AddCityToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :city_id, :integer
  end
end
