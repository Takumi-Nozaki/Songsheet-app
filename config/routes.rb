Rails.application.routes.draw do
  get 'mies/show'

  resources :photos

  resource :my, only: %i(show)

  devise_scope :users do
    get 'login', to: 'devise/sessions#new'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: 'home#top'
  
end
