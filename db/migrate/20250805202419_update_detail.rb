class UpdateDetail < ActiveRecord::Migration[8.0]
  def change
    rename_column :details, :products_id, :product_id
  end
end
