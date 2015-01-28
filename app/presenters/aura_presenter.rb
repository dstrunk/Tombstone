require 'delegate'

class AuraPresenter < SimpleDelegator

  def pending_count
    pending.count
  end

  def live_count
    live.count
  end

  def archived_count
    archived.count
  end

  def remaining_count
    30 - live_count
  end

  def model
    __getobj__
  end
end
