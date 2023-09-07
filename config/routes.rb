Rails.application.routes.draw do
  get 'body_temperature/index'
  get 'body_temperature/new'
  get 'body_temperature/show'
  get 'body_temperature/edit'

  # ログイン・ログアウト機能はsessionsコントローラで作成
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'search_tag', to: 'diaries#search_tag'

  namespace :admin do
    resources :users
  end

  root to: 'tops#index' # トップページのみ別コントローラで作成

  resources :milks, :meals, :baths, :medicines, :execretions, :symptoms, :vaccinations, :diaries, :temperatures, :head_circumferences
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
