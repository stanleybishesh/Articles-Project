# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
   field :create_article, mutation: Mutations::Articles::CreateArticle
   field :create_user, mutation: Mutations::Users::CreateUser
   field :create_organization, mutation: Mutations::Organizations::CreateOrganization
   field :create_comment, mutation: Mutations::Comments::CreateComment
   field :create_profile, mutation: Mutations::Profiles::CreateProfile
   field :create_direct_upload, mutation: Mutations::CreateDirectUpload

   field :edit_article, mutation: Mutations::Articles::EditArticle
   field :edit_comment, mutation: Mutations::Comments::EditComment
   field :edit_organization, mutation: Mutations::Organizations::EditOrganization
   field :edit_user, mutation: Mutations::Users::EditUser
   field :edit_profile, mutation: Mutations::Profiles::EditProfile

   field :destroy_article, mutation: Mutations::Articles::DestroyArticle
   field :destroy_comment, mutation: Mutations::Comments::DestroyComment
   field :destroy_organization, mutation: Mutations::Organizations::DestroyOrganization
   field :destory_user, mutation: Mutations::Users::DestroyUser
   field :destory_profile, mutation: Mutations::Profiles::DestroyProfile
  end
end
