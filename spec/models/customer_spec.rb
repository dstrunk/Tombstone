require 'rails_helper'

RSpec.describe Customer, :type => :model do
  it { should have_many(:auras) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
