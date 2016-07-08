# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

8.times do
  r = Random.new
  num = r.rand(9000..100000)
  book = Book.new({title:Faker::Book.title,
    price:Faker::Commerce.price,
    author:Faker::Book.author,
    image:Faker::Placeholdit.image,
    publisher:Faker::Book.publisher,
    genre: Faker::Book.genre,
    date_published: Faker::Date.backward(num)})
  book.save
end
