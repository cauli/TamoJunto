class Event < ActiveRecord::Base
  include Event::StateMachineHandler
  belongs_to :organization
  validates :name, :description, :local, :starts_at, :ends_at, :time, :organization_id, presence: true
  dragonfly_accessor :image
end
