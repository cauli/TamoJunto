class Event < ActiveRecord::Base
  include Event::StateMachineHandler

  belongs_to :organization
  has_and_belongs_to_many :topics
  validates :name, :description, :local, :starts_at, :ends_at, :time, :organization_id, presence: true

  dragonfly_accessor :image
  acts_as_taggable

  scope :visible, ->{ where(state: 'visible') }
end
