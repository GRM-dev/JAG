class Advert < ActiveRecord::Base
  has_many :company
  has_many :job_category
  has_many :city


end
