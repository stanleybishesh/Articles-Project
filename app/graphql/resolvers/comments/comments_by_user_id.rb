module Resolvers
  module Comments
    class CommentsByUserId < BaseResolver
      type [Types::Comments::CommentType], null:true
      argument :user_id, ID, required: true

      def resolve(user_id:)
        user = User.find(user_id)
        if user.present?
          if user.comments.present?
            user.comments
          else
            raise ArgumentError, "User does not have any comments"
          end
        else
          raise GraphQL::ExecutionError, "User does not exist brother"
        end
      end

    end
  end
end