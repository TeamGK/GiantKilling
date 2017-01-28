class RenameCommenterColumnToComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :commenter, :article_id
  end
end
