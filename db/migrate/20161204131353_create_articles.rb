class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :shop
      t.text :description
      t.string :title
      

      t.timestamps
    end
  end
end
