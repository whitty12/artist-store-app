class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.references :product
      t.references :user

      t.timestamps
    end
  end
end
