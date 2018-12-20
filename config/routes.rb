Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'realing#index' # トップ
  get  '/login', to: 'rearing#login' # ログイン
  post '/authenticate', to: 'rearing#authenticate' # ログイン認証
  post '/logout', to: 'rearing#logout' # ログアウト
  get  '/rearing', to: 'rearing#index' # トップ
  namespace 'api' do
    namespace 'v1' do
      resources :users
      get  'user/index', to: 'user#index' # ユーザ一覧
      post 'user/create', to: 'user#create' # ユーザ作成
      post 'user/update', to: 'user#update' # ユーザ更新
      post 'user/login', to: 'user#login' # トップ
      post 'user/logout', to: 'user#logout' # トップ
      get 'temp_humidity/index', to: 'temp_humidity#index' # 温湿度取得
      post 'temp_humidity/create', to: 'temp_humidity#create' # 温湿度取得
    end
  end
end
