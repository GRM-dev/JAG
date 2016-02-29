class Advert < ActiveRecord::Base
  belongs_to :company
  belongs_to :job_category
  belongs_to :city

  validates :company, presence: true;
  validates :city, presence: true;
  validates :url, presence: true, uniqueness: true;
  validates :date_adv_link_added, presence: true;
  validates :city, presence: true;
  validates :city, presence: true;
  validates :job_category, presence: true;
end
