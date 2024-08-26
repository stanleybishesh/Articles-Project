class Mutations::Users::EditUser < Mutations::BaseMutation
    null true

    argument :organization_id, ID
    argument :user_id, ID
    argument :name, String
    argument :email, String
    argument :password, String

    field :user, Types::Users::UserType
    field :errors, [String], null: false

    def resolve(organization_id:, user_id:, name:, email:, password:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Organization not found" if organization.nil?

        user = organization.users.find(user_id)
        raise GraphQL::ExecutionError, "User not found in this organization" if user.nil?

        updated_user = user.update(name: name, email:email, password: password)
        if updated_user
            {
                user: user,
                errors: []
            }
        else
            {
                user: [],
                errors: [user.errors.full_messages]
            }
        end
    end
end