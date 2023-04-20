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
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
    @search = params["search"]
    if @search.present?
      @name = @search["title"]
      @movies = Movie.where(name:@name)
    end

  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
  end
end
