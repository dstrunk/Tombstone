class Customer < ActiveRecord::Base
  has_many :auras

  validates_presence_of :name
  validates_uniqueness_of :name
end
