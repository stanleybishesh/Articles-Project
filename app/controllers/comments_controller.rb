class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: %i[create destroy edit update]

  def create
    article_comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
  end
  
  def update
    @comment = article_comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = article_comments.find(params[:id])
    if valid_user?
      @comment.destroy
      flash[:notice] = "Comment deleted."
    else
      flash[:notice] = "You are not authorized to delete this comment."
    end
    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :commenter, :body, :status)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def article_comments
    @article.comments
  end

  def valid_user?
    current_user.id == @article.user_id || current_user.id == @comment.user_id
  end
  
end
