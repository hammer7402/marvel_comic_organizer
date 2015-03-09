Rails.application.routes.draw do

  root to: redirect('/login')
  resource :login, only: [:show, :new, :create, :destroy] do

    member do
      post :authenticate
    end

  end

  get '/comics' => 'comics#comics'

  resources :comics_data

  get '/bins' => 'comics_data#bins'
  get '/bins/:id' => 'comics_data#binComic'
  # resources :comics, only: []

end
