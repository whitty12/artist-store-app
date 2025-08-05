class UpdateCart < ActiveRecord::Migration[8.0]
  def change
    add_column :carts, :user_id, :integer
  end
end
