class UpdateProductType < ActiveRecord::Migration[8.0]
  def change
    remove_column :product_types, :type

  end
end
