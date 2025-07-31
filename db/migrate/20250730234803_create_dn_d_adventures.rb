class CreateDnDAdventures < ActiveRecord::Migration[8.0]
  def change
    create_table :dn_d_adventures do |t|
      t.string :title
      t.string :dnd_version
      t.references :creator
      #t.references :product, polymorphic: true

      t.timestamps
    end
  end
end
