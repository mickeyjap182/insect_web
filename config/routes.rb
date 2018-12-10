Rails.application.routes.draw do
  get 'user/index'
  get 'user/register'
  get 'user/modify'
  get 'user/login'
  get 'user/logout'
    get 'static_pages/multiplic'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#top' # トップ
    get  '/rearing', to: 'rearing#index' # トップ
end
