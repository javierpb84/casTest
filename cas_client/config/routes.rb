Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                       :sessions => "users/sessions" }

  as :user do
    get '/sign_in', to:  'users/omniauth_callbacks#passthru'

  end

  # as :user do
  #   get "/login" => "devise/sessions#new"
  # end
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: 'home#index'

end

