class Theme < ActiveRecord::Base

  validates :title, :description, presence: true
end
