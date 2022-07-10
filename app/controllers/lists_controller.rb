class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = @list.bookmarks
  end

  def new
    @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to List.last
    else
      render new_list_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
