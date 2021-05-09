Rails.application.routes.draw do
  scope "/:locale", locale: /en|br/  do
    root 'home#index'

    get 'new/session' => 'sessions#new'
    post 'sessions' => 'sessions#create'
    get 'session/logout' => 'sessions#destroy'

    get 'login' => 'login#index'
    post 'login' => 'login#login'
    get resources :recipes
    get 'usuarios' => 'usuarios#index' 
  end
end
