class Event < ActiveRecord::Base
  include Event::StateMachineHandler
  validates :name, :description, :local, :starts_at, :ends_at, :time, presence: true
end
