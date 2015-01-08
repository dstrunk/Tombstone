require 'rails_helper'

RSpec.describe Aura, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:job_number) }
  it { should belong_to(:status) }
end
