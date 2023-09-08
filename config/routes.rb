Rails.application.routes.draw do

  # ログイン・ログアウト機能はsessionsコントローラで作成
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # 日記検索画面用
  get 'search_tag', to: 'diaries#search_tag'

  # 育児記録まとめ用
  get 'summary', to: 'tops#summary'

  namespace :admin do
    resources :users
  end

  root to: 'tops#index' # トップページのみ別コントローラで作成

  resources :milks, :meals, :baths, :medicines, :execretions, :symptoms, :vaccinations, :diaries, :temperatures, :head_circumferences, :heights, :weights
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
