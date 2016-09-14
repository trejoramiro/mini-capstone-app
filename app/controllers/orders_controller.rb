class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    #@book = Book.find_by(id: params[:form_product_id])
    user_items = CartedProduct.where(user_id: current_user.id)
    @shopping_cart = user_items.where(status: "carted")


    subtotal = 0
    quantity = 0
    @shopping_cart.each do |product|
      #@book = Book.find_by(id: params[:product_id])

      #tax = (@book.price * params[:form_quantity].to_i) * 0.09
      #subtotal = (@book.price * params[:form_quantity].to_i)
      #total = subtotal + tax
      quantity = quantity + product.quantity
      row_total = (product.quantity * product.book.price)
      subtotal = subtotal + row_total
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new({
      # quantity: params[:form_quantity],
      # user_id: current_user.id,
      # product_id: params[:product_id],
      # tax: tax,
      # subtotal: subtotal,
      # total: total
      # })
      quantity: quantity,
      user_id: current_user.id,
      tax: tax,
      subtotal: subtotal,
      total: total
      })

    if @order.save
      # @shopping_cart.each do |product|
      #   product.assign_attributes({status: "purchased", order_id: @order.id})
      #   product.save
      # end
      @shopping_cart.update_all(status: "purchased", order_id: @order.id)
    end

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    # @book = Book.find_by(id: @order.product_id)
    render 'show.html.erb'
  end

end
