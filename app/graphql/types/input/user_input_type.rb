module Types
    module Input
        class UserInputType < Types::BaseInputObject
            argument :organization_id, ID
            argument :name, String
            argument :email, String
            argument :password, String
        end
    end
end