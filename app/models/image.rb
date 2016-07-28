class Image < ActiveRecord::Base
  belongs_to :book

  validates :url, presence: true
end
