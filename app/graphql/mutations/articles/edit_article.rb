class Mutations::Articles::EditArticle < Mutations::BaseMutation
    null true

    argument :organization_id, ID
    argument :user_id, ID
    argument :article_id, ID
    argument :title, String
    argument :body, String
    argument :status, String
    argument :name, String

    field :article, Types::Articles::ArticleType
    field :errors, [String], null: false

    def resolve(body:, user_id:, title:, organization_id:, status:, name:, article_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Organization not found" if organization.nil?

        user = organization.users.find(user_id)
        raise GraphQL::ExecutionError, "User not found in this organization" if user.nil?

        article = user.articles.find(article_id)
        raise GraphQL::ExecutionError, "Article not found in this user's collection" if article.nil?
        
        updated_article = article.update(title:title,body:body,status:status,name:name)
        if updated_article
            {
                article: article,
                errors: []
            }
        else
            {
                article: [],
                errors: [article.errors.full_messages]
            }
        end
    end

end