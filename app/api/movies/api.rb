module Movies
  class API < Grape::API
    format :json
    prefix :api
    version 'v1', :path

    helpers do
      params :movie_params do
        requires :name, type: String, allow_blank: false
        requires :released, type: DateTime, allow_blank: false
        optional :points, type: Integer
        optional :liked, type: Boolean
      end
    end

    resources :movies do
      # GET /api/v1/movies
      desc 'It returns all movies'
      get { Movie.all }

      # GET /api/v1/movies/:id
      desc 'Return specific movie'
      route_param :id, type: Integer do
        get do
          movie = Movie.find(params[:id])
          { movie: movie }
        rescue ActiveRecord::RecordNotFound
          error!('Record Not Found', 404)
        end
      end

      # POST /api/v1/movies
      desc 'Creates a movie object'
      params do
        use :movie_params
      end
      post do
        movie = Movie.create!(declared(params))
        { movie: movie, message: 'Movie created successfully.' }
      end

      # PUT/PATCH api/v1/movie/:id
      desc 'Update existing movie object'
      params do
        use :movie_params
      end
      route_param :id do
        put do
          movie = Movie.find(params[:id])
          movie.update(declared(params))
          { movie: movie, message: 'Movie updated successfully.'}
        rescue ActiveRecord::RecordNotFound
          error!('RecordNotFound', 404)
        end
      end

      # DELETE api/v1/movie/:id
      desc 'Deletes existing movie object'
      route_param :id, type: Integer do
        delete do
          Movie.find(params[:id]).delete
          { message: 'Movie deleted successfully.' }
        rescue ActiveRecord::RecordNotFound
          error!('Record Not Found', 404)
        end
      end
    end
  end
end
