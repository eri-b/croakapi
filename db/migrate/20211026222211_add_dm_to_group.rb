class AddDmToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :dm, :boolean
  end
end
