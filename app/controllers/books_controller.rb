class BooksController < ApplicationController

  def index
    @books = Book.all
    render 'index.html.erb'
  end

  def show
    # using the hash "params[]"
    @book = Book.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @new_book = Book.new({
      title: params[:form_book_title],
      author: params[:form_author],
      price: params[:form_price],
      publisher: params[:form_publisher],
      image: params[:form_image],
      date_published: params[:form_date_published],
      genre: params[:form_genre]
      })

    @new_book.save

    render 'create.html.erb'
  end

  def edit
    @book = Book.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @book = Book.find_by(id: params[:id])
    #updates and saves at the same time
    @book.update(
      title: params[:form_book_title],
      author: params[:form_author],
      price: params[:form_price],
      publisher: params[:form_publisher],
      image: params[:form_image],
      genre: params[:form_genre],
      date_published: params[:form_date_published]
      )

    render 'update.html.erb'
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    render 'destroy.html.erb'
  end

end
