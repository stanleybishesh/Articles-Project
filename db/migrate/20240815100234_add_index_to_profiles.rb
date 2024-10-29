class AddIndexToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :organization_id, :integer
    add_index :profiles, :organization_id
  end
end
