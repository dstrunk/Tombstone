require 'delegate'

class AuraPresenter < SimpleDelegator

  def pending
    model.includes(:status)
      .where("state = ?", "pending")
      .references(:status)
  end

  def pending_count
    pending.count
  end

  def approved
    model.includes(:status)
      .where("state = ?", "approved")
      .references(:status)
  end

  def approved_count
    approved.count
  end

  def live
    model.includes(:status)
      .where("state = ?", "live")
      .references(:status)
  end

  def live_count
    live.count
  end

  def archived
    model.includes(:status)
      .where("state = ?", "archived")
      .references(:status)
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
