class Company < ActiveRecord::Base
  has_many :advert

  validates :name, presence: true, uniqueness: true
end
