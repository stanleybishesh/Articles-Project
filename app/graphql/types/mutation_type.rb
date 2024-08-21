# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
   field :create_article, mutation: Mutations::Articles::CreateArticle
   field :create_user, mutation: Mutations::Users::CreateUser
  end
end
