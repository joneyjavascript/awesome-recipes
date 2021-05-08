Rails.application.routes.draw do
  scope "/:locale", locale: /en|br/  do
    root 'home#index'
    get 'login' => 'login#index'
    get resources :recipes
    get 'usuarios' => 'usuarios#index' 
  end
end
