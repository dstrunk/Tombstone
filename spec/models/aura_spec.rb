require 'rails_helper'

RSpec.describe Aura, :type => :model do
  it { should have_many(:aura_transitions) }
  it { should belong_to(:job_number).inverse_of(:auras) }
  it { should belong_to(:customer).inverse_of(:auras) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_uniqueness_of(:name) }

end
