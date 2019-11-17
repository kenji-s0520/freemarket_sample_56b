class RemoveIdentificationFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :identification, :string
  end
end
