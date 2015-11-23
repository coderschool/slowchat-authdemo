class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates_length_of :password, minimum: 8
end
