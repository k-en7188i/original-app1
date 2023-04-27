class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :urllink, null: false
      t.string :category_id, null: false

      # t.references :category_id, null: false, foreign_key: true 将来的にはこうしたい

      t.timestamps
    end
  end
end
