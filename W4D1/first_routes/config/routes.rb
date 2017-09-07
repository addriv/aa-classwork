Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/:id' , to: 'users#show', as: 'user'
  # get 'users' , to: 'users#index', as: 'users'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # post 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  get 'users/:user_id/artworks', to: 'artworks#index'

  resources :users, only: [:create, :destroy, :index, :show, :update, :new]
  resources :artworks, only: [:create, :destroy, :show, :update]

  post 'artwork_shares', to: 'artwork_shares#create'
  delete 'artwork_shares/:id', to: 'artwork_shares#destroy'
  resources :comments, only: [:create, :destroy, :index]
end
