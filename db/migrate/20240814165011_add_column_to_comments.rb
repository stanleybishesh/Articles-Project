class AddColumnToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :user_id, :integer, :index
  end
end
