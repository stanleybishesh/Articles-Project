class CommentsController < ApplicationController
    # http_basic_authenticate_with name:'Bishesh',password:'bishesh123', only: :destroy
    before_action :authenticate_user!
    # before_action :correct_article, only: :destroy

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if current_user.id == @article.user_id
            @comment.destroy
            flash[:notice] = "Comment deleted."  # or use a flash message helper
        else
            flash[:notice] = "You are not authorized to delete this comment."  # or use a flash message helper
        end
        redirect_to article_path(@article), status: :see_other
    end

    # def correct_article
    #     @article = current_user.articles.find(params[:article_id])
    #     @comment = @article.comments.find(params[:id])
    #     debugger
    #     redirect_to article_path, notice: "Unauthorized access" if @comment.nil?
    # end

    private 
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end
