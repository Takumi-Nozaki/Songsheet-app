Rails.application.routes.draw do
devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

get '/' => 'home#top'

root to: 'home#top'

end
