class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :uid
      t.integer :vehicle_type
      t.timestamp :timestamp
      t.integer :heading

      t.timestamps
    end
  end
end
