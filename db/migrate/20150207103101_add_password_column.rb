class AddPasswordColumn < ActiveRecord::Migration
  def change
    add_column :volunteers, :password, :string
    add_column :volunteers, :username, :string
  end
end
