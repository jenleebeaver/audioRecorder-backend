Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #namespace allows us to create routes associated with an API and a version 

  namespace :api do 
    namespace :v1 do
      resources :users, only: [:index, :create]
      get '/login', to: 'auth#create' 
      post '/login', to: 'auth#create'
      get '/profile', to: 'auth#profile'
      resources :recordings, only: [:index, :create, :edit, :update] do
        get :audio, on: :member
      end
    end
  end
end
