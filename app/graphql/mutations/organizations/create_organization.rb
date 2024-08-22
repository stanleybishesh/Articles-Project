class Mutations::Organizations::CreateOrganization < Mutations::BaseMutation
    null true
    argument :organization_name, String, required: true

    field :organization, Types::Organizations::OrganizationType
    field :errors, [String], null:false

    def resolve(organization_name:)
        organization = Organization.find_by(name: organization_name)
        raise GraphQL::ExecutionError, "Organization already exists" if organization.present?
        new_organization = Organization.new(name: organization_name)
        if new_organization.save
            { organization: new_organization, errors: []}
        else
            { organization: [], errors: [new_organization.errors.full_messages]}
        end
    end

end