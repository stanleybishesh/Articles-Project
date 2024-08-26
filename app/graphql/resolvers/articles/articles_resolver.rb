# app/graphql/resolvers/post_resolver.rb
module Resolvers
    module Articles
        class ArticlesResolver < BaseResolver
            type [Types::Articles::ArticleType], null: true
            argument :organization_id, ID
            
            def resolve(organization_id:)
                organization = Organization.find_by(id: organization_id)
                if organization.present?
                    organization.articles
                else
                    raise GraphQL::ExecutionError, "Could not find organization"
                end
            end
        end
    end
end