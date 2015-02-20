class JobNumber < ActiveRecord::Base
  validates_uniqueness_of :number
  has_many :auras

  def name
    number
  end
end
