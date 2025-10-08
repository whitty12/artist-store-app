class MergeProductTypeToProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :medium, :string 
  end
end
