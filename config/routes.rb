Rails.application.routes.draw do
  # get 'user/index'
  # post 'user/new', to: 'user#register'
  # get 'user/modify'
  # get 'user/login'
  # get 'user/logout'
  get 'static_pages/multiplic'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#top' # トップ
  get  '/rearing', to: 'rearing#index' # トップ
  namespace 'api' do
    namespace 'v1' do
      resources :users
      post 'user/create', to: 'user#create' # トップ
      post 'user/login', to: 'user#login' # トップ
      post 'user/logout', to: 'user#logout' # トップ
    end
  end
end
