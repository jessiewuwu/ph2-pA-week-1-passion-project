class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table  :volunteers do |t|
      t.string  :name
      t.string  :email
      t.string  :password_hash
      t.string  :username
      t.timestamps
    end
  end
end
