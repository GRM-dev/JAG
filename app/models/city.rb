class City < ActiveRecord::Base
  has_many :advert
  belongs_to :province

  validates :name, presence: true, uniqueness: true
end
