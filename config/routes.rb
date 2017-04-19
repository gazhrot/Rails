Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, path: '/', constraints: { subdomain: 'api' } do

    resources :todos do
      resources :items
    end

    resources :users do
      resources :clients
      resources :order_histories
      resources :visit_histories
    end

    resources :enterprise_users do
      resources :users
      resources :enterprises
    end

  end
end
