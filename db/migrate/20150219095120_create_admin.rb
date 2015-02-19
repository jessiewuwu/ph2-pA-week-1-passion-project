class CreateAdmin < ActiveRecord::Migration
  def change
    create_table  :admins do |t|
      t.string  :name
      t.string  :email
      t.string  :username
      t.string  :password_hash
    end
  end
end
