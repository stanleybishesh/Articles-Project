module Resolvers
  module Users

    class UsersResolver < BaseResolver
      type [Types::Users::UserType], null:false
      argument :organization_id, ID
      # argument :id, ID, required: true

      def resolve(organization_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Organization does not exist !" if organization.nil?
        organization.users
      end

    end
  end
end