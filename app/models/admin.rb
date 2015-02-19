require 'bcrypt'

class Admin < ActiveRecord::Base
  include BCrypt
  has_many :ratings
  has_many :dogs, :through => :ratings

  validates :name, presence: true
  validates :email, presence: true
  validates :username, presence: true
  validates :password, :presence => true, length: {minimum: 6}, confirmation: true
  validates :password_hash, length: {minimum: 6}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
