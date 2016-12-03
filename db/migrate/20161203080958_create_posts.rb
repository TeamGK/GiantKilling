class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :shop
      t.text :description
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
