class JobNumber < ActiveRecord::Base
  has_many :auras

  validates_presence_of :number
  validates_uniqueness_of :number
  validates_length_of :number, is: 6
  validates :number, numericality: { only_integer: true }

  def name
    number
  end
end
