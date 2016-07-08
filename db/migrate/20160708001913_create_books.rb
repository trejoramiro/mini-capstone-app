class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :price
      t.string :author
      t.string :image
      t.string :publisher
      t.string :genre
      t.string :date_published

      t.timestamps null: false
    end
  end
end
