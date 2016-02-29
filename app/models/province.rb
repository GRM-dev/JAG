class Province < ActiveRecord::Base
  has_many :advert
  has_many :city

  validates :name, presence: true, uniqueness: true
end
