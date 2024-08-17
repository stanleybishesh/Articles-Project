class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.date :date_of_birth
      t.string :gender
      t.string :phone_number
      t.string :address
      t.string :country
      t.string :occupation
      t.string :github_url

      t.timestamps
    end
  end
end
