class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :type
      t.string :price
      t.string :shop
      t.string :brand
      t.integer :post_id

      t.timestamps
    end
  end
end
