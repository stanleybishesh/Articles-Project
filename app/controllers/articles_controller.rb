class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :valid_user?, only: [:edit, :update, :destroy]
  before_action :find_org, only: [:index, :show, :edit, :new, :create]

  def index
    @articles = @organization.articles
  end
  
  def show
    find_article(params[:id])
  end
  
  def new 
    @article = org_user_article.build
  end
  
  def create
    @article = org_user_article.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_article(params[:id])
  end

  def update
    find_article(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_article(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id, :organization_id)
  end

  def valid_user?
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to articles_path, notice: "Not authorized to manipulate this article !!" if @article.nil?
  end

  def org_user_article
    @organization.users.find_by(id: current_user.id).articles
  end

  def find_article(id)
    @article = Article.find(id)
  end
  
end