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
    end

    resources :clients

    resources :enterprise do
        resources :enterprise_users
    end

  end
end
