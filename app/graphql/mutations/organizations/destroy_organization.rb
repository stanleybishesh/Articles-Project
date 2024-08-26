class Mutations::Organizations::DestroyOrganization < Mutations::BaseMutation
    null true

    argument :organization_id, ID, required: true

    field :message, String, null: true
    field :errors, [String], null: false

    def resolve(organization_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Could not find organization" if organization.nil?

        if organization.destroy
            {
                message: "Organization deleted successfully",
                errors: []
            }
        else
            {
                message: [],
                errors: [organization.errors.full_messages]
            }
        end
    end
end