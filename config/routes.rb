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
  get '/checkout' => 'carts#checkout'
  get '/payment' => 'carts#payment'
  get '/confirmation' => 'orders#confirmation'
  resources :sessions, only: :create
  resources :cart_shirts, only: [:create, :update, :destroy]
  resource :carts, only: :show, path: 'cart'
  resources :customers, only: [:create, :update]
  resources :orders, only: :create do
    get :confirmation, on: :member
  end

  namespace :admin do
    root to: 'admin#index'
    resources :colors, only: :create
    resources :sizes, only: :create
    resources :meals
    resources :shirts
  end
end
