class City < ActiveRecord::Base
  has_many :advert
  belongs_to :province
  
  accepts_nested_attributes_for :province

  validates :name, presence: true, uniqueness: true
end
