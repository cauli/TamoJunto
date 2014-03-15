require 'spec_helper'

describe Service::StateMachineHandler do
  let(:service){ Service.make! state: 'pending' }

  describe '#pending?' do
    it { expect(service.pending?).to be_true }
  end

  describe '#reject!' do
    before { service.reject! }
    it { expect(service.rejected?).to be_true }
  end

  describe '#approve!' do
    before { service.approve! }
    it { expect(service.visible?).to be_true }
  end
end
