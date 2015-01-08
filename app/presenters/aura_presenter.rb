require 'delegate'

class AuraPresenter < SimpleDelegator

  def pending_count
    model.where(status: "pending").count
  end

  def approved_count
    model.where(status: "approved").count
  end

  def live_count
    model.where(status: "live").count
  end

  def archived_count
    model.where(status: "archived").count
  end

  def remaining_count
    30 - live_count
  end

  def model
    __getobj__
  end
end