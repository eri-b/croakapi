class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :group_member, null: false, foreign_key: true, index: true
      t.references :group, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
