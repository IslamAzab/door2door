class ChangeUuidType < ActiveRecord::Migration[5.1]
  def change
    change_column :vehicles, :uuid, :string, limit: 36, null: false
  end
end
