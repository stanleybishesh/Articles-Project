Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'articles#index'
  
  # get "/articles/myArticles", to:"articles#myArticles"
  # get "/articles", to:"articles#index"
  # get "/articles/:id", to:"articles#show"
  resources :my_articles
  resources :articles do
    resources :comments
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
