require 'rails_helper'

RSpec.describe JobNumber, :type => :model do
  it { should have_many(:auras) }
  it { should validate_presence_of(:number) }
  it { should validate_uniqueness_of(:number) }
  it { should validate_numericality_of(:number) }
end
