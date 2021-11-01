class CleanUpGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :creator_id
    add_column :groups, :creator_id, :integer, index: true
  end
end
