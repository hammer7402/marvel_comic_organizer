Rails.application.routes.draw do

  root to: redirect('/login')
  resource :login, only: [:show, :new, :create, :destroy] do

    member do
      post :authenticate
    end

  end

  get '/comics' => 'comics#comics'

  resources :comics_data
  # resources :comics, only: []

end
