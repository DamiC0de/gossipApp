Rails.application.routes.draw do
  root 'gossips#index'
  get '/team', to: 'teams#show', as: 'team'
  get '/contact', to: 'contacts#show', as: 'contact'
  get 'profile', to: 'users#show', as: 'profile'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create, :show, :edit, :update]
  
  resources :gossips, only: [:new, :create, :index, :show, :edit] do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :likes
  end

  # Move this line to the bottom
  # get '/:name', to: 'welcomes#show', as: 'welcome'
end
