class RenameRoomNumberColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :room_number, :room_for_number
  end
end
