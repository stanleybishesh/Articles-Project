class AddColumnToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string, default: "", null: false
  end
end
