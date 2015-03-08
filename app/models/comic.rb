class Comic < ActiveRecord::Base
  has_and_belongs_to_many :bins
  has_many                :user, through: :bin

end
