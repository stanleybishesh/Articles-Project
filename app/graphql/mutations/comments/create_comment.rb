class Mutations::Comments::CreateComment < Mutations::BaseMutation
    null true
    argument :article_id, ID
    argument :user_id, ID
    argument :organization_id, ID
    argument :commenter, String
    argument :body, String
    argument :status, String

    field :comment, Types::Comments::CommentType
    field :errors, [String], null:false

    def resolve(article_id:, organization_id:, user_id:, commenter:, body:, status:)
        organization = Organization.find(organization_id)
        user = organization.users.find(user_id)
        article = organization.articles.find(article_id)
        {errors:["Organization does not exist !"]} if organization.nil?
        raise GraphQl::ExecutionError, "User does not belong to this organization" if user.nil?
        raise GraphQL::ExecutionError, "Article does not belong to this organization" if article.nil?
        comment = article.comments.create(user_id: user_id, commenter:commenter, body:body, status:status)
        if comment.valid?
            {
                comment: comment,
                errors: []
            }
        else
            {
                comment: [],
                errors: [comment.errors.full_messages]
            }
        end
    end

end