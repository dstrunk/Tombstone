class Aura < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  has_many :aura_transitions

  def state_machine
    @state_machine ||= AuraStateMachine.new(self, transition_class: AuraTransition)
  end

  validates_presence_of :name, :start_date, :end_date
  validates_uniqueness_of :name

  belongs_to :job_number, inverse_of: :auras
  belongs_to :customer, inverse_of: :auras


  rails_admin do
    edit do
      field :job_number, :belongs_to_association
      field :customer, :belongs_to_association
      field :description
      field :name
      field :start_date
      field :end_date
    end

    exclude_fields :id, :created_at, :updated_at, :description
  end

  private

  def self.transition_class
    AuraTransition
  end

  def self.initial_state
    :pending
  end
end
