BodyFuel::Application.routes.draw do
  root to: 'home#index'
  get '/order' => 'home#order'
  get '/about' => 'home#about'
  get '/menu' => 'home#menu'
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

  resources :shirts, only: :none do
    get '/design/:style', to: 'shirts#design', on: :member
  end

  namespace :admin do
    resources :orders, only: [:index, :show] do
      member do
        put :fulfill
        get :unfulfill
      end
    end
    resources :shirt_colors, only: :create
    resources :text_colors, only: :create
    resources :sizes, only: :create
    resources :meals
    resources :shirts
    resource :users, only: [:edit, :update], path: :profile
  end
end
