class AddMutedToGroupMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :group_members, :muted, :boolean, default: false
  end
end
