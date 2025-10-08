class SecondProductUpdate < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :product_details_id, :integer
  end
end
