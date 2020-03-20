Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :foods
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# ==================================
  # API subdomain
  # ==================================
  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      resources :foods, :categories, :physical_activities, :goals, only: [:index]
      resources :facebook_user_token, :customers, only: [:create]
      #custom user routes
      get '/users/current', to: 'users#current', as: 'current_user'
    end
    match '(*path)', to: 'errors#routing', via: :all
  end
end
