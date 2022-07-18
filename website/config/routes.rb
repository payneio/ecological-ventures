# See https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users
  resources :users, :only =>[:index, :show]
  resources :taxa, path: "species"
  resources :solutions
  resources :ecosystems
  resources :ecoregions, :only => [:index, :show]
  resources :people
  resources :problems
  resources :ventures

  get '/about', to: 'pages#about', as: 'about'

  root "ventures#index"
end
