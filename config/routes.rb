Rails.application.routes.draw do
  resources :photos
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get '/' => 'home#top'

end
