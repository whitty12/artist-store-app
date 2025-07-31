class CreateStores < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.references :product
      t.references :cart
      #t.references :user

      t.timestamps
    end
  end
end
