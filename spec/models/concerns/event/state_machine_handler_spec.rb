require 'spec_helper'

describe Event::StateMachineHandler do
  let(:event){ Event.make! state: 'pending' }

  describe '#pending?' do
    it { expect(event.pending?).to be_true }
  end

  describe '#reject!' do
    before { event.reject! }
    it { expect(event.rejected?).to be_true }
  end

  describe '#approve!' do
    before { event.approve! }
    it { expect(event.visible?).to be_true }
  end

  describe '#cancel!' do
    before { event.cancel! }
    it { expect(event.canceled?).to be_true }
  end
end
