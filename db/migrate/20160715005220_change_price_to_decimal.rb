class ChangePriceToDecimal < ActiveRecord::Migration
  def change
    change_column :books, :price, "numeric USING CAST (price AS numeric)", precision: 5, scale: 2
  end
end
