namespace :import do
    desc "Import users from csv"
    task users: :environment do
        filename = File.join Rails.root, "users.csv"
        CSV.foreach(filename) do |row|
            p row
        end
    end
end