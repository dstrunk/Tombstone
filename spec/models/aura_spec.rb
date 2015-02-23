require 'rails_helper'

RSpec.describe Aura, :type => :model do
  it { should have_many(:aura_transitions) }
  it { should belong_to(:job_number).inverse_of(:auras) }
  it { should belong_to(:customer).inverse_of(:auras) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_uniqueness_of(:name) }

  describe 'transitions' do
    let(:aura) { FactoryGirl.create(:aura) }
    it 'is in state unstarted by default' do
      expect(aura.current_state).to eq 'unstarted'
    end

    it 'cannot transition from unstarted to live' do
      expect { aura.transition_to!(:live) }.to raise_error(Statesman::TransitionFailedError)
    end

    it 'cannot transition from unstarted to archived' do
      expect { aura.transition_to!(:archived) }.to raise_error(Statesman::TransitionFailedError)
    end

    it 'can transition from unstarted to rejected' do
      expect { aura.transition_to!(:rejected) }.to_not raise_error
    end

    it 'can transition from unstarted to accepted' do
      expect { aura.transition_to!(:accepted) }.to_not raise_error
    end
  end

end
