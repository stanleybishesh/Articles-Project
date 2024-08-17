class Mutations::Articles::CreateArticle < Mutations::BaseMutation
  null true
  argument :user_id, String
  argument :title, String
  argument :body, String
  argument :organization_id, String


  field :article, Types::Articles::ArticleType
  field :errors, [String], null: false


  def resolve(body:, user_id:, title:, organization_id:)
    user = User.find_by(id: user_id)
    if user.present?
        article = user.articles.create(title: title, body: body, organization_id: organization_id, status: 'public')
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