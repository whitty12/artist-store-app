class RemoveProductIdFromPromotions < ActiveRecord::Migration[8.0]
  def change
    remove_column :promotions, :product_id, :integer
  end
end
