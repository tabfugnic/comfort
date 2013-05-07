Comfort::Application.routes.draw do
  root to: "topics#index"

  get "welcome" => "static#welcome", as: :welcome
  resources :topics do
    resources :ratings
  end

  namespace :users do
    get "sign_in" => "sessions#new"
    get "sign_up" => "sessions#new"
    get "sign_in/:id" => "sessions#bypass"
    match "sign_out" => "sessions#destroy"
  end
  get "/auth/google_oauth2/callback" => "users/sessions#create"
  resources :users

end
