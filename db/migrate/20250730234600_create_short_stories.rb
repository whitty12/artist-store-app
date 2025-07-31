class CreateShortStories < ActiveRecord::Migration[8.0]
  def change
    create_table :short_stories do |t|
      t.string :title
      t.integer :pages
      t.integer :word_count
      t.references :creator
      #t.references :product, polymorphic: true

      t.timestamps
    end
  end
end
