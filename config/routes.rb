Rails.application.routes.draw do
  get 'bath/show'
  get 'bath/edit'
  get 'bath/index'
  get 'bath/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root to: 'tops#index'

  resources :milks, :meals
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
