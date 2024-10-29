module Resolvers
  module Profiles
    class ProfilesResolver < BaseResolver
      type [Types::Profiles::ProfileType], null:false

      def resolve
        Profile.all
      end

    end
  end
end