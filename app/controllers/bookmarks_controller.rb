class BookmarksController < ApplicationController
  def show
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = params[:list_id]
    @movie = params[:bookmark][:movie_id]
    @bookmark.list_id = @list
    @bookmark.movie_id = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_bookmark_path(@list)
    end

  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
