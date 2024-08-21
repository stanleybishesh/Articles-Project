module Resolvers
  module Profiles
    class GetProfileResolver < BaseResolver
      type Types::Profiles::ProfileType, null:false
      argument :organization_name, String, required:true
      argument :user_name, String, required:true

      def resolve(organization_name:,user_name:)
        organization = Organization.find_by(name: organization_name)
        user = User.find_by(name: user_name)
        if organization.present?
          if user.present?
            if user.profile.present?
              user.profile
            else
              raise ArgumentError, "User has not created profile."
            end
          else
            raise ArgumentError, "User does not exist in this organization."
          end
        else
          raise ArgumentError, "Organization does not exist."
        end
      end

    end
  end
end