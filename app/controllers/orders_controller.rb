class OrdersController < ApplicationController

  def create
    #@book = Book.find_by(id: params[:form_product_id])
    @book = Book.find_by(id: params[:product_id])
    tax = (@book.price * params[:form_quantity].to_i) * 0.09
    subtotal = (@book.price * params[:form_quantity].to_i)
    total = subtotal + tax

    @order = Order.new({
      quantity: params[:form_quantity],
      user_id: current_user.id,
      product_id: params[:product_id],
      tax: tax,
      subtotal: subtotal,
      total: total
      })
    @order.save

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @book = Book.find_by(id: @order.product_id)
    render 'show.html.erb'
  end
end
