class User < ActiveRecord::Base
  has_secure_password
  has_one :profile

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, format: { with: /\A\S{8,128}\z/}
  # validates :profile, presence: true, uniqueness: true

  # after_create :build_profile

  def build_profile
    Profile.create(user: self)
  end

  def advertiser?
    self.moderator? || self.role == UserRole.find(2)
  end

  def moderator?
    self.admin? || self.role == UserRole.find(3)
  end

  def admin?
    self.head_admin? || self.role == UserRole.find(4)
  end

  def head_admin?
    self.role == UserRole.find(5)
  end
end
