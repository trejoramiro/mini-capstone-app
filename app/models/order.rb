class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :book #foreign_key: 'product_id'
  has_many :carted_products
  has_many :books, through: :carted_products

  #executing them in rails console
  #order.product -> returns one product
  #order.user -> returns one user

  monetize :subtotal, :as => "subtotal_money"
  monetize :tax, :as => "tax_money"
  monetize :total, :as => "total_money"
end
