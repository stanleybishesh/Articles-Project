# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
   field :create_article, mutation: Mutations::Articles::CreateArticle
   field :create_user, mutation: Mutations::Users::CreateUser
   field :create_organization, mutation: Mutations::Organizations::CreateOrganization
   field :create_comment, mutation: Mutations::Comments::CreateComment
   field :create_profile, mutation: Mutations::Profiles::CreateProfile
   field :create_direct_upload, mutation: Mutations::CreateDirectUpload
  end
end
