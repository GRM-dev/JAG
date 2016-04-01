class Province < ActiveRecord::Base
  has_many :city

  validates :name, presence: true, uniqueness: true
  
  default_scope {order('name ASC')}
  
  scope :default, -> {where(name: 'Śląskie')}
end
