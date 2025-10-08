class ChangeUsernameToUnique < ActiveRecord::Migration[8.0]
  def change
     update_column :users, :username, null:false
     add_index :users, :username, unique: true
  end
end
