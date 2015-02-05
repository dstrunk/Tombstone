class AuraStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :approved
  state :denied
  state :live
  state :archived

  transaction from :pending,  to: [:approved, :denied]
  transaction from :approved, to: [:live]
  transaction from :denied,   to: [:archived]
  transaction from :live,     to: [:archived]

  before_transition(:pending) do |aura|
  end

end
