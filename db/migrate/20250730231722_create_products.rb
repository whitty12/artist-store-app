class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.references :promotion
      t.refrences :creator
      t.references :product_detail
      t.references :product_type
      
      t.timestamps
    end
  end
end
