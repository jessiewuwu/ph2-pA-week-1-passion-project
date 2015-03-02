class Dog < ActiveRecord::Base
  has_many :ratings
  has_many :volunteers, :through => :ratings

  has_many :favorites
  has_many :volunteers, :through => :favorites
end
