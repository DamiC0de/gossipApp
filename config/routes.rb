Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root 'gossips#index'
  get '/team', to: 'teams#show', as: 'team'
  get '/contact', to: 'contacts#show', as: 'contact'
  get '/gossips/:id', to: 'gossips#show', as: 'gossip'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create]
  resources :gossips

  # Move this line to the bottom
  # get '/:name', to: 'welcomes#show', as: 'welcome'
end
