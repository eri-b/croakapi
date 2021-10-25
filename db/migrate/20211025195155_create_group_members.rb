class CreateGroupMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_members do |t|
      t.references :group, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
