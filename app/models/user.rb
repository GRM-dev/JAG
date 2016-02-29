class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :password_digest, presence: true, format: { with: /\A\S{8,128}\z/}

end
