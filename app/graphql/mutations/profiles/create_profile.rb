class Mutations::Profiles::CreateProfile < Mutations::BaseMutation
    null true
    argument :user_id, ID
    argument :organization_id, ID
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

    def resolve(user_id:,organization_id:,date_of_birth:,gender:,phone_number:,address:,country:,occupation:,github_url:,facebook_url:,linkedin_url:,instagram_url:,twitter_url:)
        organization = Organization.find(organization_id)
        user = organization.users.find(user_id)
        raise GraphQL::ExecutionError, "Organization does not exist" if organization.nil?
        raise GraphQL::ExecutionError, "User does not exist in this organization" if user.nil?
        profile = user.build_profile(user_id:user_id,organization_id:organization_id,
        date_of_birth:date_of_birth,gender:gender,phone_number:phone_number,address:address,country:country,
        occupation:occupation,github_url:github_url,facebook_url:facebook_url,linkedin_url:linkedin_url,
        instagram_url:instagram_url,twitter_url:twitter_url)
        if profile.save
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