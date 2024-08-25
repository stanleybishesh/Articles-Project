class Mutations::Organizations::EditOrganization < Mutations::BaseMutation
    null true
    argument :organization_id, ID, required: true
    argument :organization_name, String, required: true

    field :organization, Types::Organizations::OrganizationType
    field :errors, [String], null:false

    def resolve(organization_id:,organization_name:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Organization not found" if organization.nil?

        updated_organization = organization.update(name: organization_name)
        if updated_organization
            { organization: organization, errors: []}
        else
            { organization: [], errors: [organization.errors.full_messages]}
        end
    end

end