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

  resources :associations, :only => [:index]
  put "associations/add_association" => "associations#add_association", as: :add_association
  delete "associations/remove_association" => "associations#remove_association", as: :remove_association

  get '/about', to: 'pages#about', as: 'about'

  root "ventures#index"
end
