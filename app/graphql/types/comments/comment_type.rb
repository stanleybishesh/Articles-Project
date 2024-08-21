module Types
  module Comments
    class CommentType < Types::BaseObject
      field :id, ID, null:false
      field :commenter, String, null:false
      field :body, String, null:false
      field :status, String, null:false
    end
  end
end