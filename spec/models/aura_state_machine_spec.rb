require 'rails_helper'

RSpec.describe AuraStateMachine, :type => :model do

  describe "transition guards" do
    let(:state_machine) { FactoryGirl.build(:aura_state_machine) }

    it "cannot transition from unstarted to live or archived" do
      expect { state_machine.transition!(:live) }.to raise_error(Statesman::GuardFailedError)
      expect { state_machine.transition!(:archived) }.to raise_error(Statesman::GuardFailedError)
    end

    it "can transition from unstarted to accepted or rejected" do
      expect { state_machine.transition!(:accepted) }.to_not raise_error
      expect { state_machine.transition!(:rejected) }.to_not raise_error
    end
  end
end
