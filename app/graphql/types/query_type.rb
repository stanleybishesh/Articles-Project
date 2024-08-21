# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :articles, resolver: Resolvers::Articles::ArticlesResolver
    field :user, resolver: Resolvers::Users::UsersResolver
    field :comments, resolver: Resolvers::Comments::CommentsResolver
    field :organizations, resolver: Resolvers::Organizations::OrganizationsResolver
    field :profiles, resolver: Resolvers::Profiles::ProfilesResolver
    field :profileByOrgAndUserName, resolver: Resolvers::Profiles::GetProfileResolver
    field :photos, resolver: Resolvers::Photos::PhotosResolver
    field :memberships, resolver: Resolvers::Memberships::MembershipsResolver
  end
end
