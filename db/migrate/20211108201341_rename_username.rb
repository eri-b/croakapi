class RenameUsername < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :username, :nickname
  end
end
