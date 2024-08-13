class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def find_article_by_article_id
    @article = Article.find(params[:article_id])
  end

  def find_article_by_id
    @article = Article.find(params[:id])
  end

  def article_comments
    return @article.comments
  end

  def org_user_article
    return @organization.users.find_by(id: current_user.id).articles
  end

end
