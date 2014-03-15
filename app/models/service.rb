class Service < ActiveRecord::Base
  include Service::StateMachineHandler

  belongs_to :organization
  validates :name, :description, :local, presence: true
end
