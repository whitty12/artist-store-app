class MergerProductDetailIntoProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :description, :string
    add_column :products, :price, :float
    add_column :products, :available, :boolean
    
    

  end
end
