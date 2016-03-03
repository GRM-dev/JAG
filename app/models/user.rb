class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, format: { with: /\A\S{8,128}\z/}

  def moderator?
    self.admin? || self.role == 'mod'
  end

  def admin?
    self.head_admin? || self.role == 'admin'
  end

  def head_admin?
    self.role == 'hadmin'
  end
end
