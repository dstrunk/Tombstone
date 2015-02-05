require 'delegate'

class AuraPresenter < SimpleDelegator

  def pending
    in_state(:pending)
  end

  def live
    in_state(:live)
  end

  def approved
    in_state(:approved)
  end

  def denied
    in_state(:denied)
  end

  def archived
    in_state(:archived)
  end


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

  def recently_ending
    live
      .where("end_date < ?", DateTime.now + 30.days)
      .order(end_date: :asc)
  end

  def model
    __getobj__
  end
end
