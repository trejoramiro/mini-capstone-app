class AddSuppliersIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :supplier_id, :integer
  end
end
