class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :find_org, only: [:index, :show, :edit, :new, :create]
  before_action :find_article_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @articles = @organization.articles
  end
  
  def show
  end
  
  def new 
    @article = org_user_article.build
  end
  
  def create
    @article = org_user_article.build(article_params)
    save_article
  end

  def edit
  end

  def update
    update_article
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id, :organization_id)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to articles_path, notice: "Not authorized to manipulate this article !!" if @article.nil?
  end

  def find_org
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
  end

  def save_article
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update_article
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
end