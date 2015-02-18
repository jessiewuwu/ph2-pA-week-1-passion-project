class RemoveDogAgeColumn < ActiveRecord::Migration
  def change
    remove_column :dogs, :age, :integer
  end
end
