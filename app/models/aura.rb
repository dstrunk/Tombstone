class Aura < ActiveRecord::Base
  validates_presence_of :name, :start_date, :end_date, :status
  validates_uniqueness_of :name
  enum status: [:pending, :approved, :live, :denied, :archived]

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
      field :status
    end

    exclude_fields :id, :created_at, :updated_at
  end

  # For Rails Admin
  def status_enum
    ['pending', 'approved', 'live', 'denied', 'archived']
  end

  include Workflow
  workflow_column :status

  workflow do
    state :pending
    state :approved
    state :live
    state :denied
    state :archived
  end
end
