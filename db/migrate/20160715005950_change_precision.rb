class ChangePrecision < ActiveRecord::Migration
  def change
    change_column :books, :price, :decimal, precision: 5, scale: 2
  end
end
