class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    find_article(params[:article_id])
    article_comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    find_article(params[:article_id])
    @comment = article_comments.find(params[:id])
    delete_if_valid_user
    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def find_article(id)
    @article = Article.find(id)
  end

  def article_comments
    @article.comments
  end

  def delete_if_valid_user
    if current_user.id == @article.user_id
      @comment.destroy
      flash[:notice] = "Comment deleted."
    else
      flash[:notice] = "You are not authorized to delete this comment."
    end
  end
  
end
