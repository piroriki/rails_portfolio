Rails.application.routes.draw do
  get 'medicines/index'
  get 'medicines/new'
  get 'medicines/show'
  get 'medicines/edit'

  # ログイン・ログアウト機能はsessionsコントローラで作成
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root to: 'tops#index' # トップページのみ別コントローラで作成

  resources :milks, :meals, :baths
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
