class CreateProductTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :product_types do |t|
      t.string :medium #the medium used to create
      t.string :artstyle #art style: novel, short story, ect.

      t.timestamps
    end
  end
end
