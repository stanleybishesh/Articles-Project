class ArticlesController < ApplicationController
  # http_basic_authenticate_with name:'Bishesh',password:'bishesh123', except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def myArticles
    @articles = Article.all
  end

  def new 
    # @article = Article.new
    @article = current_user.articles.build
  end

  def create
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to articles_path, notice: "Not authorized to manipulate this article !!" if @article.nil?
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end