module Grapes
  module V1
    class Movies < Grapes::API
      resources :movies do
        # GET /api/v1/movies
        desc 'It return all movies'
        get { Movie.all }
      end
    end
  end
end
