class AddComments < ActiveRecord::Migration
  def change
    add_column :ratings, :comments, :text
  end
end
