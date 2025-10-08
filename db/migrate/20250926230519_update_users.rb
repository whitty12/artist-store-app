class UpdateUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :string, default: "basic user"
  end
end
