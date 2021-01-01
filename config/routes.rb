Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #namespace allows us to create routes associated with an API and a version 

  namespace :api do 
    namespace :v1 do
      resources :users, only: [:index]
      resources :recordings, only: [:index]
    end
  end
end
