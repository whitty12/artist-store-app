class CopyProductTypeIntoProduct < ActiveRecord::Migration[8.0]
  def up
    ProductType.find_each do |product_type|
      product = Product.find_by(id: product_type.product_id)
      next unless product
      
      product.update_columns(
        description: detail.description,
        price: detail.price,
        available: detail.in_stock == 1
        # ... map all other columns
      )
    end
  end
end
