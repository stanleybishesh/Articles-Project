class MyArticlesController < ApplicationController
    def index
        @my_articles = current_user.articles
    end
end
