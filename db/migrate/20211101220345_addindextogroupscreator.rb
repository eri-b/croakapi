class Addindextogroupscreator < ActiveRecord::Migration[6.0]
  def change
    add_index :groups, :creator_id
  end
end
