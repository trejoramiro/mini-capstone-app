class CreateCategorizedBooks < ActiveRecord::Migration
  def change
    create_table :categorized_books do |t|
      t.integer :category_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
