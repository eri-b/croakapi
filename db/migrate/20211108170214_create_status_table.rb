class CreateStatusTable < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.string :body
      t.timestamps
    end
  end
end
