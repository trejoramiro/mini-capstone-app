class SuppliersController < ApplicationController
before_action :authenticate_admin!

  def index
    @suppliers = Supplier.all
    render 'index.html.erb'
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'suppliers/new.html.erb'
  end

  def create
    @supplier = Supplier.new({
      name: params[:form_name],
      email: params[:form_email],
      phone_number: params[:form_phone]
      })

    @supplier.save
    flash[:success] = "Supplier <strong>successfully</strong> created."
    redirect_to "/suppliers/#{@supplier.id}"
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
    render 'suppliers/edit.html.erb'
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.update(
      name: params[:form_name],
      email: params[:form_email],
      phone_number: params[:form_phone]
      )

    flash[:success] = "Supplier <strong>successfully</strong> updated."
    redirect_to "/suppliers/#{@supplier.id}"

  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
    flash[:danger] =  "Successfully <strong>deleted</strong> Supplier."
    redirect_to '/suppliers'
  end

end
