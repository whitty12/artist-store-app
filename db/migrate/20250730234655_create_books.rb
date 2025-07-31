class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publishing_house
      t.integer :pages
      t.integer :word_count
      t.references :creator
      #t.references :product, polymorphic: true

      t.timestamps
    end
  end
end
