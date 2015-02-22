class User < ActiveRecord::Base
  include Clearance::User
  has_many :auras

  def name
    email
  end
end
