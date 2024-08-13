class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :home]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :find_org, only: [:index, :show, :new, :create]

  def find_org
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
  end

  def home
  end

  def index
    @articles = @organization.articles
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def myArticles
    @articles = current_user.articles
  end
  
  def new 
    @article = @organization.users.find_by(id: current_user.id).articles.build
  end
  
  def create
    @article = @organization.users.find_by(id: current_user.id).articles.build(article_params)
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
    params.require(:article).permit(:title, :body, :status, :user_id, :organization_id)
  end
end