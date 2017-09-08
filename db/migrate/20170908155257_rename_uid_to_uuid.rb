class RenameUidToUuid < ActiveRecord::Migration[5.1]
  def change
    rename_column :vehicles, :uid, :uuid
  end
end
