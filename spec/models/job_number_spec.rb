require 'rails_helper'

RSpec.describe JobNumber, :type => :model do
  it { should have_many(:auras) }
end
