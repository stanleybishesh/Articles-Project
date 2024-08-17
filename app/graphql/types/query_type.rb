# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :articles, resolver: Resolvers::Articles::ArticlesResolver
  end
end
