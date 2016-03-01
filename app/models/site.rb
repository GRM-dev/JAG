class Site < ActiveRecord::Base
  has_many :advert

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
