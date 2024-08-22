module Resolvers
    module Comments
        class CommentsByArticleId < BaseResolver
            type [Types::Comments::CommentType], null:true
            argument :article_id, ID, required: true

            def resolve(article_id:)
                article = Article.find(article_id)
                raise GraphQL::Error, "Article not found !" if article.nil?
                article.comments
            end

        end
    end
end