class User < ActiveRecord::Base
  has_many :bins
  has_many :comics, through: :bins
  has_secure_password

end
