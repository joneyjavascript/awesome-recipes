Rails.application.routes.draw do
  get '', to: redirect('/br')

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

  namespace :api do
    namespace :v1 do
      post 'sessions' => 'sessions#create'
      resources :recipes
    end
  end
end
