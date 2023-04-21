class BookmarksController < ApplicationController

  def new
    @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
  end
end
