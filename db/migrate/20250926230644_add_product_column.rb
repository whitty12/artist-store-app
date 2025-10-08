class AddProductColumn < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :creator_id, :integer
  end
end
