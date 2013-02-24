OneWayAir::Application.routes.draw do

  get "/login" => 'Sessions#new', as: "login"

  post "sessions/create" => 'Sessions#create', as: "create_session"

  get "/logout" => 'Sessions#destroy', as: "logout"

  resources :users

  root to: 'flights#index'
  # get '/flights' => 'flights#index', as: :flights

end
