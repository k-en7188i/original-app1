class ChangeGenderToGenderIdInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :gender, :string
    add_column :users, :gender_id, :integer, null: false
  end
end
