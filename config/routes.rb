Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  get '/top/index'           , to: 'top#index'
  get '/register/index'      , to: 'register#index'
  get '/register_comp/index' , to: 'register_comp#index'
  get '/authentication/index', to: 'authentication#index'
  get '/authentication/index', to: 'authentication#index'
  get '/receipt/index'       , to: 'receipt#index'
  get '/receipt/create'      , to: 'receipt#create'
  get '/receipt/patch'       , to: 'receipt#patch'
  get '/family/index'        , to: 'family#index'
  get '/family/patch'        , to: 'family#patch'
  get '/resetPassword/index' , to: 'reset_password#index'
end
