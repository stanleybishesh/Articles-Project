class Mutations::Users::DestroyUser < Mutations::BaseMutation
    null true

    argument :organization_id, ID
    argument :user_id, ID

    field :message, String, null: true
    field :errors, [String], null: false

    def resolve(organization_id:,user_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Could not find organization" if organization.nil?

        user = organization.users.find(user_id)
        raise GraphQL::ExecutionError, "Could not find user in this organization" if user.nil?

        if user.destroy
            {
                message: "User deleted successfully",
                errors: []
            }
        else
            {
                message: [],
                errors: [user.errors.full_messages]
            }
        end
    end
end