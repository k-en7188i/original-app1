class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :user_id, :bigint, null: false
    add_foreign_key :posts, :users
  end
end
