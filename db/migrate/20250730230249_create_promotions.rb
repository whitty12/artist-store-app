class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :promotion_description
      t.float :discount_percent

      t.timestamps
    end
  end
end
