Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :users
  get '/search' => 'users#search'
  get '/create' => 'sessions#create'
  get '/log_out' => 'sessions#log_out'

  root 'users#index'
end
