class Service < ActiveRecord::Base
  include Service::StateMachineHandler
  belongs_to :organization
  validates :name, :description, :local, :organization_id, presence: true
  dragonfly_accessor :image
  acts_as_taggable
end
