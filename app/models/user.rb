class User < ActiveRecord::Base
  has_secure_password
  has_one :profile

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, format: { with: /\A\S{8,128}\z/}

   after_create :build_profile

  def build_profile
    Profile.create(user_id: self.id)
  end

  def advertiser?
    self.moderator? || self.user_role_id == 2
  end

  def moderator?
    self.admin? || self.user_role_id == 3
  end

  def admin?
    self.head_admin? || self.user_role_id == 4
  end

  def head_admin?
    self.user_role_id == 5
  end
end
