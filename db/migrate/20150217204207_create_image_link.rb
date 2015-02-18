class CreateImageLink < ActiveRecord::Migration
  def change
    add_column :dogs, :image_link, :string
  end
end
