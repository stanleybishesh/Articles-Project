class MyArticlesController < ApplicationController
    def index
        @articles = current_user.articles
    end
end
