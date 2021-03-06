Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  namespace :v0 do
     resources :pings, only: [:index], constraints: { format: 'json' }
  end
  namespace :v1, default: {format: :json}do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    resources :performance_data, only: [:create, :index]
    end
  end
end
