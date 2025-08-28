class CreateCarts < ActiveRecord::Migration[8.0]
  #Change the name to cart items
  def change
    create_table :cart_items do |t|
      t.references :product
      t.references :user

      t.timestamps
    end
  end
end
