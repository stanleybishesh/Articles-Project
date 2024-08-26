class Mutations::Comments::EditComment < Mutations::BaseMutation
    null true
        argument :comment_id, ID
        argument :article_id, ID
        argument :user_id, ID
        argument :commenter, String
        argument :body, String
        argument :status, String

        field :comment, Types::Comments::CommentType
        field :errors, [String], null:false

        def resolve(comment_id:, article_id:, user_id:, commenter:, body:, status:)
            user = User.find(user_id)
            raise GraphQL::ExecutionError, "User not found" if user.nil?

            article = Article.find(article_id)
            raise GraphQL::ExecutionError, "Article not found" if article.nil?

            comment = article.comments.find(comment_id)
            raise GraphQL::ExecutionError, "Comment not found" if comment.nil?

            raise GraphQL::ExecutionError, "Unauthorized to edit this comment" if comment.user_id != user.id
            updated_comment = comment.update(commenter: commenter, body: body, status: status)
            if updated_comment
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