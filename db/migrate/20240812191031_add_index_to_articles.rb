class AddIndexToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :organization_id, :integer
    add_index :articles, :organization_id
  end
end
