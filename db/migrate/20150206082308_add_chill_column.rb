class AddChillColumn < ActiveRecord::Migration
  def change
    add_column :ratings, :chill, :string
  end
end
