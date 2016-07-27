class CartedProduct < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  belongs_to :order
end
