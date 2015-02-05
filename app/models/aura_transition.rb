class AuraTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition
  belongs_to :aura, inverse_of: :aura_transitions
end
