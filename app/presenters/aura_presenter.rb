require 'delegate'

class AuraPresenter < SimpleDelegator
  def model
    __getobj__
  end
end
