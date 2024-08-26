class Mutations::Profiles::DestroyProfile < Mutations::BaseMutation
    null true

    argument :user_id, ID
    argument :organization_id, ID
    argument :profile_id, ID

    field :message, String, null: true
    field :errors, [String], null: false

    def resolve(organization_id:, user_id:, profile_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Could not find organization" if organization.nil?

        user = organization.users.find(user_id)
        raise GraphQL::ExecutionError, "Could not find user in this organization" if user.nil?

        profile = organization.profiles.find(profile_id)
        raise GraphQL::ExecutionError, "Could not find profile in this organization" if profile.nil?

        raise GraphQL::ExecutionError, "Unauthorized to delete the profile !!!" unless user.id == profile.user_id

        if profile.destroy
            {
                message: "Profile deleted successfully",
                errors: []
            }
        else
            {
                message: [],
                errors: [profile.errors.full_messages]
            }
        end
    end
end