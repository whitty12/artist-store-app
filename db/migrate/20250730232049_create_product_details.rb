class CreateDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :product_details do |t|
      t.references :product
      t.string :description
      t.decimal :price
      t.integer :in_stock

      t.timestamps
    end
  end
end
