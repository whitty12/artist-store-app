class CreateProductTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :product_types do |t|
      t.string :medium
      t.string :artstyle

      t.timestamps
    end
  end
end
