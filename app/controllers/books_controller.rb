class BooksController < ApplicationController

  def get_all_books
    @books = Book.all
    render 'all_books.html.erb'
  end

  def get_one_book
    @book = Book.find_by(id: params[:id])
    render 'book.html.erb'
  end
end
