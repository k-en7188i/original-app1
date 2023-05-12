class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true, unique: true
      t.references :post, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
