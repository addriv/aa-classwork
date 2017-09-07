Rails.application.routes.draw do

  resources :users
  resource :session, only: [ :new, :create, :destroy ]

  resources :fuck_lists do
    resources :fucks, only: [:new, :create]
  end

  resources :comments

  resources :fucks, except: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
