class Mutations::Comments::DestroyComment < Mutations::BaseMutation
    null true

    argument :comment_id, ID
    argument :article_id, ID
    argument :user_id, ID

    field :message, String, null: true
    field :errors, [String], null: false

    def resolve(comment_id:,article_id:,user_id:)
        user = User.find(user_id)
        raise GraphQL::ExecutionError, "Could not find user" if user.nil?

        article = Article.find(article_id)
        raise GraphQL::ExecutionError, "Could not find article" if article.nil?

        comment = article.comments.find(comment_id)
        raise GraphQL::ExecutionError, "Could not find comment" if comment.nil?

        raise GraphQL::ExecutionError, "Unauthorized to delete comment !!!" unless user.id == comment.user_id
        
        if comment.destroy
            {
                message: "Comment deleted successfully",
                errors: []
            }
        else
            {
                message: [],
                errors: [comment.errors.full_messages]
            }
        end
    end
end