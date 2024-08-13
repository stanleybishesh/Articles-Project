class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_article_by_article_id, only: [:create, :destroy]

    def create
        article_comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @comment = article_comments.find(params[:id])
        check_user
        redirect_to article_path(@article), status: :see_other
    end

    private 
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end

    def check_user
        if current_user.id == @article.user_id
            @comment.destroy
            flash[:notice] = "Comment deleted."
        else
            flash[:notice] = "You are not authorized to delete this comment."
        end
    end
end
