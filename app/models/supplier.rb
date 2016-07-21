class Supplier < ActiveRecord::Base
  #has many  when using this will generate books
  has_many :books
end
