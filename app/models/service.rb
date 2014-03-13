class Service < ActiveRecord::Base
  belongs_to :organization
  validates :name, :description, :local, presence: true
end
