class AddDmLookupToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :dm_lookup, :string
  end
end
