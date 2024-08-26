# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :articles, resolver: Resolvers::Articles::ArticlesResolver
    field :my_articles, resolver: Resolvers::Articles::MyArticlesResolver
    field :users, resolver: Resolvers::Users::UsersResolver
    field :commentsByUserId, resolver: Resolvers::Comments::CommentsByUserId
    field :commentsByArticleId, resolver: Resolvers::Comments::CommentsByArticleId
    field :organizations, resolver: Resolvers::Organizations::OrganizationsResolver
    field :profiles, resolver: Resolvers::Profiles::ProfilesResolver
    field :profileByOrgAndUserName, resolver: Resolvers::Profiles::GetProfileResolver
    field :photos, resolver: Resolvers::Photos::PhotosResolver
    field :memberships, resolver: Resolvers::Memberships::MembershipsResolver
  end
end
