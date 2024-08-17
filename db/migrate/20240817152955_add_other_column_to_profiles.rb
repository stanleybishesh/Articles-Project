class AddOtherColumnToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :facebook_url, :string
    add_column :profiles, :linkedin_url, :string
    add_column :profiles, :instagram_url, :string
    add_column :profiles, :twitter_url, :string
  end
end
