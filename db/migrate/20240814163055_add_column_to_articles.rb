class AddColumnToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :name, :string
  end
end
