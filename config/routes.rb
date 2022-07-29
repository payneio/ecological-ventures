# See https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  devise_for :users

  resources :users, :only =>[:index, :show]
  resources :taxa, path: "species"
  resources :solutions
  resources :ecosystems

  resources :realms, :only => [:index, :show]
  resources :subrealms, :only => [:index, :show]
  resources :bioregions, :only => [:index, :show]
  resources :ecoregions, :only => [:index, :show]
  resources :people
  put "people/:id/claim", to: "people#claim", as: :claim_person
  put "people/:id/unclaim", to: "people#unclaim", as: :unclaim_person

  resources :problems
  resources :ventures

  resources :associations, :only => [:index]
  put "associations/add_association" => "associations#add_association", as: :add_association
  delete "associations/remove_association" => "associations#remove_association", as: :remove_association

  get '/about', to: 'pages#about', as: 'about'

  root "ventures#index"
end
