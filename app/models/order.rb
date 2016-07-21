class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  #executing them in rails console
  #order.product -> returns one product
  #order.user -> returns one user

end
