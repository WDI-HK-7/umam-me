class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :location, :string
    add_column :restaurants, :cuisine, :string
    add_column :restaurants, :price, :string
  end
end
