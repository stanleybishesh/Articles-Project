class Mutations::Articles::CreateArticle < Mutations::BaseMutation
  null true
  argument :user_id, ID
  argument :title, String
  argument :body, String
  argument :organization_id, ID
  argument :status, String
  argument :name, String

  field :article, Types::Articles::ArticleType
  field :errors, [String], null: false

  def resolve(body:, user_id:, title:, organization_id:, status:, name:)
    user = User.find_by(id: user_id)
    if user.present?
        article = user.articles.create(title: title, body: body, organization_id: organization_id, status: status, name: name)
        if article.valid?
            {
                article: article,
                errors: []
            }
        else
            {
                article: nil,
                errors: [article.errors.full_messages]
            }
        end
    else
        {
            artilce: nil,
            errors: ["user not found"]
        }
    end
  end
end