class CartedProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    # association established in the user model to make this work
    # association established in the carted_products to make this work
    # current_user.carted_products.where(status: "carted")
    user_items = CartedProduct.where(user_id: current_user.id)
    @shopping_cart = user_items.where(status: "carted")
    if @shopping_cart.length != 0
      render "index.html.erb"
    else
      flash[:success] = "You have nothing in your cart."
      redirect_to "/"
    end
  end

  def create
    @new_row = CartedProduct.new({
      user_id: current_user.id,
      book_id: params[:product_id],
      quantity: params[:form_quantity],
      status: "carted"
      })

    @new_row.save

    redirect_to "/cart"
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.assign_attributes({status: "removed"})
    @carted_product.save

    flash[:warning] = "Item removed from shopping cart."
    redirect_to "/cart"
  end

end
