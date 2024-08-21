# frozen_string_literal: true

module Types
  module Profiles
    class ProfileType < Types::BaseObject
      field :id, ID, null: false
      field :date_of_birth, GraphQL::Types::ISO8601Date
      field :gender, String
      field :phone_number, String
      field :address, String
      field :country, String
      field :occupation, String
      field :github_url, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :user_id, Integer
      field :organization_id, Integer
      field :facebook_url, String
      field :linkedin_url, String
      field :instagram_url, String
      field :twitter_url, String
    end
  end
end
