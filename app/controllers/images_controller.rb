class ImagesController < ApplicationController
  #  def index
  #   render 'index.html.erb'
  # end

  def show
  end

  def new
    @book = Book.find_by(id: params[:book_id])
    render 'images/new.html.erb'
  end

  def create
    @new_image = Image.new({
      url: params[:form_url],
      book_id: params[:book_id]
      })

    @new_image.save

    flash[:success] = "Image <strong>successfully</strong> created."
    redirect_to "/books/#{params[:book_id]}"
  end

  def edit
    # do the update
    @images = Image.all.where(book_id: params[:book_id])
    @book = Book.find_by(id: params[:book_id])
    render 'edit.html.erb'
  end

  def update
    @book = Book.find_by(id: params[:book_id])
    @book.images.each do |image|
      image.url = params[:images]["#{image.id}"]["url"]
      image.save
    end
    flash[:success] = "Book Images <strong>successfully</strong> updated."
    render 'books/show.html.erb'
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy

    flash[:danger] = "Successfully <strong>deleted</strong> Image."
    redirect_to "/images/#{params[:book_id]}/edit"
  end
end
