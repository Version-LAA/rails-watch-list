class BookmarksController < ApplicationController

  def index
    @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
  end
  def new
    @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
  end

  def create
    @bookmark = Bookmark.new()
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:content)
  end
end
