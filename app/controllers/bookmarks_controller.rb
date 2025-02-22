class BookmarksController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    bookmark = Bookmark.new
    bookmark.user_id = current_user.id
    bookmark.book_id = book.id
    bookmark.save!
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    bookmark = Bookmark.find_by(book_id: @book.id, user_id: current_user.id)
    bookmark.destroy
    redirect_to request.referer
  end
end
