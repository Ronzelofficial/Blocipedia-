Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
