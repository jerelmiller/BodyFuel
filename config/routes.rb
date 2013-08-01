BodyFuel::Application.routes.draw do
  root to: 'home#index'
  get '/about' => 'home#about'
  get '/store' => 'home#store'
  get '/fitness' => 'home#fitness'
  get '/order' => 'home#order'
  get '/nutrition' => 'home#nutrition'
  get '/about' => 'home#about'
  get '/contact' => 'home#contact'
  post '/contact' => 'home#contact_submit'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  resources :sessions, only: :create
  resources :cart_shirts, only: :create

  namespace :admin do
    root to: 'admin#index'
    resources :colors, only: :create
    resources :sizes, only: :create
    resources :meals
    resources :shirts
  end
end
