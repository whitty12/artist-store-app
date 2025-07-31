class CreateDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :details do |t|
      t.references :products
      t.string :description
      t.decimal :price
      t.integer :in_stock

      t.timestamps
    end
  end
end
