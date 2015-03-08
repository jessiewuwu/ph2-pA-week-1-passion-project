class Favorite < ActiveRecord::Base
  has_many :user
  has_many  :dogs
end
