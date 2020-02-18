Rails.application.routes.draw do
  resources :foods
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# ==================================
  # API subdomain
  # ==================================
  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      resources :foods
    end
    match '(*path)', to: 'errors#routing', via: :all
  end
end
