OneWayAir::Application.routes.draw do

  get "flights/index"

  root to: 'flights#index'
  get '/flights' => 'flights#index', as: :flights
end
