require 'delegate'

class AuraPresenter < SimpleDelegator
  COUNT_LIMIT = 30

  def pending_count
    in_state(:pending).count
  end

  def live_count
    in_state(:live).count
  end

  def archived_count
    in_state(:archived).count
  end

  def remaining_count
    COUNT_LIMIT - live_count
  end

  def recently_ending
    in_state(:live)
      .where("end_date < ? AND end_date >= ?", DateTime.now + 30.days, DateTime.now)
      .order(end_date: :asc)
  end

  def recently_ending?
    recently_ending.count > 0
  end

  def past_due
    in_state(:live)
      .where("end_date <= ?", DateTime.now)
      .order(end_date: :asc)
  end

  def past_due?
    past_due.count > 0
  end

  def model
    __getobj__
  end
end
