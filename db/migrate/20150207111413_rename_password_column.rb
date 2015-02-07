class RenamePasswordColumn < ActiveRecord::Migration
  def change
    rename_column :volunteers, :password, :password_hash
  end
end
