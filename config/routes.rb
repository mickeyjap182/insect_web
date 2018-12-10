Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get 'user/index'
  get 'user/register'
  get 'user/modify'
  get 'user/login'
  get 'user/logout'
    get 'static_pages/multiplic'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#top' # トップ
    get  '/rearing', to: 'rearing#index' # トップ
    # get  '/multi', to: 'application#top' # トップ
end
