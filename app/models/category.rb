class Category < ActiveRecord::Base
  has_many :categorized_books
  has_many :books, through: :categorized_books

  validates :name, uniqueness: true
end
