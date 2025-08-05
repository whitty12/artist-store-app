class UpdateUser < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :cart_id
  end
end
