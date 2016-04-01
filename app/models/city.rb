class City < ActiveRecord::Base
  has_many :advert, :inverse_of => :City
  belongs_to :province
  
  accepts_nested_attributes_for :province

  validates :name, presence: true, uniqueness: { scope: [:province_id] }
  
  default_scope {order('name ASC')}
  
end
