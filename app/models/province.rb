class Province < ActiveRecord::Base
  has_many :city

  validates :name, presence: true, uniqueness: true
end
