Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  # Mount Rage routes
  Rage.routes.draw do
    get "/api/articles", to: "api/articles#index"
    get "/api/articles/:id", to: "api/articles#show"
    get "/api/articles/:article_id/comments", to: "api/articles#comments"
  end


  root "articles#index"
end
