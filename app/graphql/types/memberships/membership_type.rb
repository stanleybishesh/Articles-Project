# frozen_string_literal: true

module Types
  module Memberships
    class MembershipType < Types::BaseObject
      field :id, ID, null: false
      field :user_id, Integer
      field :organization_id, Integer
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :user, Types::Users::UserType, null: false
      field :organization, Types::Organizations::OrganizationType, null: false
    end
  end
end
