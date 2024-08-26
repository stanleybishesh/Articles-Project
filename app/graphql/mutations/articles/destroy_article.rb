class Mutations::Articles::DestroyArticle < Mutations::BaseMutation
    null true
    argument :organization_id, ID
    argument :user_id, ID
    argument :article_id, ID

    field :message, String, null:true
    field :errors, [String], null:false

    def resolve(organization_id:, user_id:, article_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Could not find organization" if organization.nil?

        user = organization.users.find(user_id)
        raise GraphQL::ExecutionError, "User not found in this organization" if user.nil?
            
        article = organization.articles.find(article_id)
        raise GraphQL::ExecutionError, "Article not found in this organization" if article.nil?

        raise GraphQL::ExecutionError, "Unauthorized to delete the article !!!" unless user.id == article.user_id

        if article.destroy
            {
                message: "Article deleted successfully !",
                errors: []
            }
        else
            {
                message: [],
                errors: [article.errors.full_messages]
            }
        end
    end
end