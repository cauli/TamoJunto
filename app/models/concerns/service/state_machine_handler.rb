module Service::StateMachineHandler
  extend ActiveSupport::Concern

  included do
    state_machine :state, initial: :pending do
      state :pending, value: 'pending'
      state :visible, value: 'visible'
      state :rejected, value: 'rejected'

      event :reject do
        transition [:pending] => :rejected
      end

      event :approve do
        transition [:pending] => :visible
      end
    end
  end
end

