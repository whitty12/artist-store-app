class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :promotions #promotion_id
      t.references :details
      t.references :product_types
      t.integer :title_id #might need tweaking

      t.timestamps
    end
  end
end
