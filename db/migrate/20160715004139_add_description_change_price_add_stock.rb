class AddDescriptionChangePriceAddStock < ActiveRecord::Migration
  def change
    add_column :books, :description, :text
    add_column :books, :stock, :boolean
  end
end
