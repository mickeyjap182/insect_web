Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#top' # トップ
    get  '/multi', to: 'application#multiplication' # トップ
    # get  '/multi', to: 'application#top' # トップ
end
