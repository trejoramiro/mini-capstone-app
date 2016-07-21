class Book < ActiveRecord::Base
  #great place to add logic  about your model
  belongs_to :supplier
  has_many :images
  has_many :orders

  def discounted?
    sale_price = 10.00
    #price_array = price.split('.')
    # price is a method built by Rails that gets the price value in the database and returns it
    # don't overwrite the getter Rails
    if price <= sale_price
      message = true
    else
      message = false
    end
    return message
  end

  def tax
    tax = 0.09
    return tax
  end

  def total
    total = price + (price * tax)
    return total
  end

  def inStock?
    if stock
      return true
    else
      return false
    end
  end



end
