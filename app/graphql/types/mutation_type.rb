# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
   field :create_article, mutation: Mutations::Articles::CreateArticle
  end
end
