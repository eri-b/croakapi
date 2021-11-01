class CreateDmMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_members do |t|
      t.integer :dm_member1, index: true
      t.integer :dm_member2, index: true
      t.references :group, foreign_key: true, index: true
      t.timestamps
    end
    add_index :dm_members, [:dm_member1, :dm_member2], unique: true
  end
end
