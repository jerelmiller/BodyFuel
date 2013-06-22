BodyFuel::Application.routes.draw do
  root to: 'home#index'
  get '/about' => 'home#about'
  get '/store' => 'home#store'
  get '/fitness' => 'home#fitness'
  get '/order' => 'home#order'
  get '/nutrition' => 'home#nutrition'
end
