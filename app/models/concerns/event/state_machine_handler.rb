module Event::StateMachineHandler
  extend ActiveSupport::Concern

  included do
    state_machine :state, initial: :pending do
      state :pending, value: 'pending'
      state :visible, value: 'visible'
      state :rejected, value: 'rejected'
      state :canceled, value: 'canceled'

      event :reject do
        transition [:pending] => :rejected
      end

      event :approve do
        transition [:pending, :canceled] => :visible
      end

      event :cancel do
        transition [:pending, :visible] => :canceled
      end
    end
  end
end
