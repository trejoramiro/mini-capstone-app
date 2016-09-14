class Book < ActiveRecord::Base
  #great place to add logic  about your model
  belongs_to :supplier
  has_many :images
  has_many :orders, foreign_key: 'product_id'
  has_many :categorized_books
  # books table does not hold category_id so through is used
  has_many :categories, through: :categorized_books
  has_many :carted_products

  ##Validations
  ##################################

  validates :title, presence: true, length: { minimum: 1 }
  validates :price, presence: true, numericality: true
  validates :author, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :genre, presence: true
  validates :publisher, presence: true, uniqueness: true
  validates :date_published, presence: true, length: { minimum: 7 }
  validates :description, length: { maximum: 500 }




  #monetize :price, :as => "price_money"

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

  def format_categories
    categories.pluck(:name).join(", ")
  end


end
