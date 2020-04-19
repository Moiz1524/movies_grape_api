require 'rails_helper'

RSpec.describe "Movies", type: :request do

  let(:movie) { create(:movie) }
  let(:movie_attrs) { attributes_for(:movie) }

  # GET /movies
  it "will display all movies" do
    get movies_path
    expect(assigns[:movies]).to be_empty
    expect(response).to render_template(:index)
    expect(response).to have_http_status(200)
  end

  # GET /movies/new
  it "will render new movie page" do
    get new_movie_path
    expect(assigns[:movie]).to be_an_instance_of(Movie)
    expect(response).to render_template(:new)
    expect(response).to have_http_status(200)
  end

  # POST /movies
  it "will create new movie" do
    post movies_path, :params => { :movie =>  movie_attrs  }
    expect(assigns[:movie].valid?).to be true
    expect(flash[:notice]).to include('Movie was successfully created.')
    expect(response).to redirect_to(movies_url)
    expect(response).to have_http_status(302)
  end

  # GET /movies/:id
  it "will show a single movie" do
    get movie_path(movie)
    expect(assigns[:movie]).to eq(movie)
    expect(response).to render_template(:show)
    expect(response).to have_http_status(200)
  end

end
