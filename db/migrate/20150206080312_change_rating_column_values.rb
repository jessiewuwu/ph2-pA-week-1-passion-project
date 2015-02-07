class ChangeRatingColumnValues < ActiveRecord::Migration
  def change
    change_column :ratings, :affectionate, :string
    change_column :ratings, :independent, :string
    change_column :ratings, :playful, :string
    change_column :ratings, :timid, :string
    change_column :ratings, :good_with_kids, :string
    change_column :ratings, :high_energy, :string
  end
end
