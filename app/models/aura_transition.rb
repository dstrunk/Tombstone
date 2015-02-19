class AuraTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition
  belongs_to :aura, inverse_of: :aura_transitions

  def to_state_enum
    [:unstarted, :rejected, :accepted, :live, :archived].each_with_index.to_a
  end
end
