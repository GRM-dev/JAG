class Experience < ActiveRecord::Base
  belongs_to :company
  belongs_to :responsibility
end
