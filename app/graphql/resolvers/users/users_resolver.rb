module Resolvers
  module Users

    class UsersResolver < BaseResolver
      type Types::Users::UserType, null:false
      # argument :organization_id, ID
      argument :id, ID, required: true

      def resolve(id:)
        User.find(id)
      end

    end
  end
end