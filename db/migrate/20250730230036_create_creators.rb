class CreateCreators < ActiveRecord::Migration[8.0]
  def change
    create_table :creators do |t|
      t.string :first_name
      t.string :last_name
      t.string :pen_name

      t.timestamps
    end
  end
end
