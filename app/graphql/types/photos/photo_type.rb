# frozen_string_literal: true

module Types
  module Photos
    class PhotoType < Types::BaseObject
      field :id, ID, null: false
      field :imageable_type, String, null: false
      field :imageable_id, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
