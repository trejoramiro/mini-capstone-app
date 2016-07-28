class BooksController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    # if params[:random]
    #   # @book = Book.find_by_sql("SELECT * FROM books
    #   # ORDER BY random()
    #   # LIMIT 1;")
    #   @book = Book.limit(1).order("RANDOM()")
    # redirect_to "/books/#{@book.ids[0]}"
    if params[:q]
      @books = Book.find_by(title: params[:q])
      @books = [@books]
    elsif params[:category]
      @books = Category.find_by(name: params[:category]).books
    elsif params[:show]
      @books = Book.where("price < ?", 10.00)
    elsif params[:descend]
      @books = Book.order("price" => :desc)
      #render 'index.html.erb'
    elsif params[:search_terms]
      @books = Book.where("title ILIKE ?", "%#{params[:search_terms]}%")
    else
      @books = Book.order(params[:sort])
    end
    @categories = Category.all
    render 'index.html.erb'
  end

  def show
    # using the hash "params[]"
    if params[:id] == 'random'
      @book = Book.all.sample
    else
      @book = Book.find_by(id: params[:id])
    end

    render 'show.html.erb'
  end

  def new
    @new_book = Book.new()
    render 'new.html.erb'
  end


  def create
    # instance of the Book class
    @new_book = Book.new({
      title: params[:form_book_title],
      author: params[:form_author],
      price: params[:form_price],
      publisher: params[:form_publisher],
      date_published: params[:form_date_published],
      genre: params[:form_genre],
      description: params[:form_description]
      })

    @image = Image.new({url: params[:form_image],
      book_id: @new_book.id})

    @image.save

    if @new_book.save
    #@image.save

      flash[:success] = "Book <strong>successfully</strong> created."
      redirect_to "/books/#{@new_book.id}"
    else
      render 'new.html.erb'
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @book = Book.find_by(id: params[:id])
    #updates and saves at the same time

    @book.assign_attributes(
      title: params[:form_book_title],
      author: params[:form_author],
      price: params[:form_price],
      publisher: params[:form_publisher],
      genre: params[:form_genre],
      date_published: params[:form_date_published],
      description: params[:form_description]
      )
      #image: params[:form_image],

    if @book.save
      flash[:success] = "Book <strong>successfully</strong> updated."
      redirect_to "/books/#{@book.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    flash[:danger] =  "Successfully <strong>deleted</strong> Book."
    redirect_to '/books'
  end

end
