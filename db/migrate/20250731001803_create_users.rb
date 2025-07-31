class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.references :cart
      t.string :email
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :address
      t.string :zipcode
      t.string :state
      t.string :sex
      t.string :birthday

      t.timestamps
    end
  end
end
