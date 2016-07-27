class ChangeColumnProductIdToBookId < ActiveRecord::Migration
  def change
      rename_column :carted_products, :product_id, :book_id
  end
end
