class AddColumnToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :user_id, :integer
    add_index :profiles, :user_id
  end
end
