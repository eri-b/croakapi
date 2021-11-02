class Changedmmemberscolumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :dm_members, :dm_member1, :dm_member1_id
    rename_column :dm_members, :dm_member2, :dm_member2_id
    remove_column :dm_members, :group_id, :integer
    add_reference :dm_members, :group, null: false, foreign_key: true
  end
end