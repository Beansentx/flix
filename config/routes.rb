Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"

  resources :users
  get "sign_up" => "users#new"
  resources :movies do
    resources :reviews
  end
  
  root "movies#index"

  # get "movies" => "movies#index"
  # get "/movies/:id" => "movies#show", as:"movie"
  # get "/movies/:id/edit" => "movies#edit", as:"edit_movie"
  # patch "movies/:id" => "movies#update"
end
