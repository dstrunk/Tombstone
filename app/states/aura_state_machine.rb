class AuraStateMachine
  include Statesman::Machine

  state :unstarted, initial: true
  state :rejected
  state :accepted
  state :live
  state :archived

  transition from: :unstarted, to: [:accepted, :rejected]
  transition from: :accepted,  to: :live
  transition from: :rejected,  to: :archived
  transition from: :live,      to: :archived

end
