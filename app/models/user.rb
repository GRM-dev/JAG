class User < ActiveRecord::Base
  has_secure_password
  belongs_to :profile

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, format: { with: /\A\S{8,128}\z/}

   after_create :build_profile

  def build_profile
    Profile.create(user_id: self.id)
  end

  def advertiser?
    self.moderator? || self.role_id == UserRole.find(2).id
  end

  def moderator?
    self.admin? || self.role_id == UserRole.find(3).id
  end

  def admin?
    self.head_admin? || self.role_id == UserRole.find(4).id
  end

  def head_admin?
    self.role_id == UserRole.find(5).id
  end
end
