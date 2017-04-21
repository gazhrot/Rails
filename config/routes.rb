Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, path: '/', constraints: { subdomain: 'api' } do

    resources :todos do
      resources :items
    end

    resources :users do
      resources :order_histories
      resources :visit_histories
      resources :user_clients
      resources :enterprise_users
    end
    post '/users/:id/enterprise/join', to: 'users#join_enterprise'

    resources :clients
    resources :enterprises

  end
end
