Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Movies::API => '/'

  get '/movies', :to => 'movies#index'
  get '/movies/new', :to => 'movies#new', :as => :new_movie
  post '/movies', :to => 'movies#create'
  get '/movies/:id', :to => 'movies#show', :as => :movie
  get '/movies/:id/edit', :to => 'movies#edit', :as => :edit_movie
  patch '/movies/:id', :to => 'movies#update'
  delete '/movies/:id', :to => 'movies#destroy'
  # resources :movies
end
