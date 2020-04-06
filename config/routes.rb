Rails.application.routes.draw do
  devise_for :nutritionists, :skip => [:registrations] 
  devise_scope :nutritionist do
    authenticated :nutritionist do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  post 'user_token' => 'user_token#create'
  resources :foods
  resources :diets, only: [:show, :edit, :update]
  resources :meals, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# ==================================
  # API subdomain
  # ==================================
  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      resources :foods, :categories, :physical_activities, :goals, only: [:index]
      resources :diets, only: [:index, :show]
      post '/diets/request_for_diet', to: 'diets#create', as: 'request_for_diet'
      resources :facebook_user_token, :customers, only: [:create]
      #custom user routes
      get '/users/current', to: 'users#current', as: 'current_user'
    end
    match '(*path)', to: 'errors#routing', via: :all
  end
end
