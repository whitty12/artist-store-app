class UpdateProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :title, :string
    remove_column :products, :title_id

  end
end
