# app/graphql/types/post_type.rb
module Types
  module Articles
    class ArticleType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null:false
      field :title, String, null: false
      field :body,  String, null: false
      field :status, String, null:false
      field :user_id, ID, null:false
      field :organization_id, ID, null:false
      field :user, Types::Users::UserType, null: false
    end
  end
end
