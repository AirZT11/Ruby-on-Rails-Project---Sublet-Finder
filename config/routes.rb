Rails.application.routes.draw do
  root "listings#index"
  resources :users
  resources :listings do
    member do
      delete :delete_image_attachment
    end
  end
  resources :neighborhoods
  resources :cities

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
