Rails.application.routes.draw do

  # ログイン・ログアウト機能はsessionsコントローラで作成
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # 日記検索画面用
  get 'search_tag', to: 'diaries#search_tag'

  # 育児記録まとめ用
  get 'summary', to: 'tops#summary'

  # ミルク記録まとめ用
  get 'milks_summary', to: 'milks#milks_summary'

  # user_idを取るため、userモデルのルーティングにrelationshipモデルをネストする
  namespace :admin do
    resources :users do
      resource :relationships, only: [:create, :destroy]
      
      # フォローリスト、フォロワーリスト表示用
      get :follows, on: :member
      get :followers, on: :member
    end
  end

  root to: 'tops#index' # トップページのみ別コントローラで作成

  resources :milks, :meals, :baths, :medicines, :execretions, :symptoms, :vaccinations, :temperatures, :head_circumferences, :heights, :weights, :children, :families

  # diary_idを取るため、diaryモデルのルーティングにlikeモデルをネストする
  resources :diaries do
    resource :likes, only: [:new, :create, :destroy]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
