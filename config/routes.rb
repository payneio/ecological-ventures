# See https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  resources :users, :only =>[:index, :show]

  resources :ecosystems

  put "revisions/:id" => "revisions#revert", as: :revert_revision

  resources :associations, :only => [:index]
  put "associations/add_association" => "associations#add_association", as: :add_association
  delete "associations/remove_association" => "associations#remove_association", as: :remove_association

  resources :taxa, path: "species" do
    resources :revisions, only: [:index, :show, :revert]
  end

  resources :solutions do
    resources :revisions, only: [:index, :show, :revert]
  end

  resources :realms, :only => [:index, :show] do
    resources :revisions, only: [:index, :show, :revert]
  end
  
  resources :subrealms, :only => [:index, :show] do 
    resources :revisions, only: [:index, :show, :revert]
  end

  resources :bioregions, :only => [:index, :show] do
    resources :revisions, only: [:index, :show, :revert]
  end
  
  resources :ecoregions, :only => [:index, :show] do 
    resources :revisions, only: [:index, :show, :revert]
  end

  resources :people do 
    resources :revisions, only: [:index, :show, :revert]
  end
  put "people/:id/claim", to: "people#claim", as: :claim_person
  put "people/:id/unclaim", to: "people#unclaim", as: :unclaim_person

  resources :problems do
    resources :revisions, only: [:index, :show, :revert]
  end

  resources :ventures do
    resources :revisions, only: [:index, :show, :revert]
  end

  get '/about', to: 'pages#about', as: 'about'

  root "ventures#index"
end
