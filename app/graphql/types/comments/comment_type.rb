module Types
  module Comments
    class CommentType < Types::BaseObject
      field :id, ID, null:false
      field :commenter, String, null:false
      field :body, String, null:false
      field :status, String, null:false
      field :user_id, ID, null:false
      field :article_id, ID, null:false
      field :user, Types::Users::UserType
      field :article, Types::Articles::ArticleType
    end
  end
end