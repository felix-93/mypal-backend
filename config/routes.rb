Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
          resources :users, only: [:create, :show]
          resources :posts, only: [:create, :show, :index, :destroy]
          resources :comments, only: [:create, :destroy]
          resources :likes, only: [:create, :destroy]
          post '/login', to: 'auth#create'
          get '/validate', to: 'auth#validate'
      end
  end
end