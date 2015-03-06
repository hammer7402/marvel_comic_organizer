class User < ActiveRecord::Base
  has_many :bins
  has_secure_password

end
