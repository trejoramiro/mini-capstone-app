class Book < ActiveRecord::Base
  #great place to add logic  about your model
  def sales_message
    sale_price = 10
    price_array = price.split('.')
    # price is a method built by Rails that gets the price value in the database and returns it
    # don't overwrite the getter Rails
    if price_array[0].to_i <= sale_price
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
    total = price.to_f + (price.to_f * tax)
    return total
  end

  def formatted_date
    date_published
  end

end
