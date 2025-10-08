class UpdateUsernameToUnique < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :username, false
    add_index :users, :username, unique: true
  end
end
