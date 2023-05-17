class ChangeGenderIdToStringInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :gender_id, :integer
    add_column :users, :gender_id, :string, null: false
  end
end
