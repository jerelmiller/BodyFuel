BodyFuel::Application.routes.draw do
  root to: 'home#index'
  get '/about' => 'home#about'
  get '/store' => 'home#store'
end
