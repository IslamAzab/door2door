class AddLatitudeAndLongitudeToVehicle < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :latitude, :float
    add_column :vehicles, :longitude, :float
  end
end
