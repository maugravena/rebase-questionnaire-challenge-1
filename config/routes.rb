Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, path: 'usuario'

      get 'client/:token/transaction_simulation',
          to: 'transaction_simulation#simulation'

      post 'client/:client_token/order',
           to: 'orders#create'
      get 'client/:token/payment_methods',
          to: 'payment_methods#index'
    end
  end
end
