class CreateHandMadeArts < ActiveRecord::Migration[8.0]
  def change
    create_table :hand_made_arts do |t|
      t.string :title
      t.string :dimensions
      t.references :creator
      #t.references :product, polymorphic: true

      t.timestamps
    end
  end
end
