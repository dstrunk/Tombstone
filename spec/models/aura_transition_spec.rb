require 'rails_helper'

RSpec.describe AuraTransition, :type => :model do
  it { should belong_to(:aura).inverse_of(:aura_transitions) }
end
