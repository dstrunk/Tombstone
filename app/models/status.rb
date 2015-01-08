class Status < ActiveRecord::Base
  validates :state, inclusion: { in: %w(pending approved live denied archived),
                                 message: "%{value} is not a valid state" }
  has_many :auras
end