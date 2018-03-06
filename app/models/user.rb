class User < ApplicationRecord
  has_many :user_places
  has_many :places, through: :user_places
  has_many :comments
  accepts_nested_attributes_for :places
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
