class User < ActiveRecord::Base
  include Clearance::User
  has_many :auras

  def name
    email
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
