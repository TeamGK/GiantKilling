class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.integer :sex
      t.string :job
      t.string :hobby
      t.string :name
      t.string :height
      t.string :weight
      t.text :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
