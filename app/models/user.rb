class User < ApplicationRecord
  has_many :userplaces
  has_many :places, through: :userplaces
  has_many :comments
end
