class Favorite < ActiveRecord::Base
  has_many :volunteer
  has_many  :dogs
end
