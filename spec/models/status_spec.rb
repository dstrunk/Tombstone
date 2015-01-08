require 'rails_helper'

RSpec.describe Status, :type => :model do
  it { should validate_inclusion_of(:state).in_array(
    %w(pending approved live denied archived)
  ) }
  it { should have_many(:auras) }
end
