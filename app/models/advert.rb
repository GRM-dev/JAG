class Advert < ActiveRecord::Base
  belongs_to :company
  belongs_to :job_category
  belongs_to :city
  belongs_to :site
  
  accepts_nested_attributes_for :city

  validates :company, presence: true
  validates :city, presence: true
  validates :url, presence: true, uniqueness: true
  validates :date_link_added, presence: true
  validates :appointment, presence: true
  validates :site, presence: true
  validates :job_category, presence: true
  validates :date_last_verified, presence: true
end
