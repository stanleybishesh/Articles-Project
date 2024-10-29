class Mutations::Profiles::EditProfile < Mutations::BaseMutation
    null true

    argument :user_id, ID
    argument :organization_id, ID
    argument :profile_id, ID
    argument :date_of_birth, String
    argument :gender, String
    argument :phone_number, String
    argument :address, String
    argument :country, String
    argument :occupation, String
    argument :github_url, String
    argument :facebook_url, String
    argument :linkedin_url, String
    argument :instagram_url, String
    argument :twitter_url, String

    field :profile, Types::Profiles::ProfileType
    field :errors, [String], null:false

    def resolve(profile_id:,user_id:,organization_id:,date_of_birth:,gender:,phone_number:,address:,country:,occupation:,github_url:,facebook_url:,linkedin_url:,instagram_url:,twitter_url:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Organization not found" if organization.nil?

        user = organization.users.find(user_id)
        raise GraphQL::ExecutionError, "User not found" if user.nil?

        profile = Profile.find(profile_id)
        raise GraphQL::ExecutionError, "Unauthorized to edit Profile" if profile.user_id != user.id

        updated_profile = profile.update(date_of_birth:date_of_birth,gender:gender,phone_number:phone_number,address:address,country:country,
        occupation:occupation,github_url:github_url,facebook_url:facebook_url,linkedin_url:linkedin_url,
        instagram_url:instagram_url,twitter_url:twitter_url)

        if updated_profile
            {
                profile: profile,
                errors: []
            }
        else
            {
                profile: [],
                errors: [profile.errors.full_messages]
            }
        end
    end
end