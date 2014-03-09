class Event < ActiveRecord::Base
  validates :name, :description, :local, :starts_at, :ends_at, :time, presence: true
end
