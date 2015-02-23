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

  after_transition(to: :accepted) do |aura|
    AuraMailer.aura_approved(aura.user, aura).deliver_later
  end

  after_transition(to: :rejected) do |aura|
    AuraMailer.aura_rejected(aura.user, aura).deliver_later
  end

  after_transition(to: :live) do |aura|
    AuraMailer.aura_live(aura.user, aura).deliver_later
  end

  after_transition(to: :archived) do |aura|
    AuraMailer.aura_archived(aura.user, aura).deliver_later
  end

end
