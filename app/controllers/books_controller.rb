class BooksController < ApplicationController

  def index
    if params[:random]
      # @book = Book.find_by_sql("SELECT * FROM books
      # ORDER BY random()
      # LIMIT 1;")
      @book = Book.limit(1).order("RANDOM()")
      redirect_to "/books/#{@book.ids[0]}"
    elsif params[:q]
      @books = Book.find_by(title: params[:q])
      @books = [@books]
      render 'index.html.erb'
    elsif params[:show]
      @books = Book.where("price < ?", 10.00)
       render 'index.html.erb'
    elsif params[:descend]
      @books = Book.order("#{params[:sort]}" => :desc)
       render 'index.html.erb'
    else
      @books = Book.order(params[:sort])
       render 'index.html.erb'
    end
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
      genre: params[:form_genre],
      description: params[:form_description]
      })

    @new_book.save

    flash[:success] = "Book <strong>successfully</strong> created."
    redirect_to "/books/#{@new_book.id}"
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
      date_published: params[:form_date_published],
      description: params[:form_description]
      )
    flash[:success] = "Book <strong>successfully</strong> updated."
    redirect_to "/books/#{@book.id}"

  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    flash[:danger] =  "Successfully <strong>deleted</strong> Book."
    redirect_to '/books'
  end

end
