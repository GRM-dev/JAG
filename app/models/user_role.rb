class UserRole < ActiveRecord::Base
  has_many :user

  validates :name, presence: true, uniqueness: true
end
