class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to root_path
  end

  def show
    @list = List.find(params[:id])
    # @search = params['search']
    @bookmarks = Bookmark.where(list_id: params[:id])
    # if @search.present?
    #   @name = @search["title"]
    #   @movies = Movie.where('title LIKE ?', @name)
    # end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def search_params
    params.require(:movie).permit(:title)
  end
end
