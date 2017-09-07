Rails.application.routes.draw do

  get 'charges/new'
  get 'charges/destroy'
  resources :users, only: [:new, :create]
  resources :wikis
  resources :collaborators, only: [:create, :destroy]
  resources :charges, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
