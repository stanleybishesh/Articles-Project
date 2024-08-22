module Resolvers
    module Articles
        class MyArticlesResolver < BaseResolver
            type [Types::Articles::ArticleType], null: true
            argument :user_id, ID, required: true

            def resolve(user_id:)
                user = User.find(user_id)
                raise GraphQL::ExecutionError, "User does not exist" if user.nil?
                user.articles
            end
        end
    end
end