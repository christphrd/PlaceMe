class User < ApplicationRecord
  has_many :userplaces
  has_many :places, through: :userplaces
  has_many :comments
  has_secure_password
  def full_name
    "#{first_name} #{last_name}"
  end
end
