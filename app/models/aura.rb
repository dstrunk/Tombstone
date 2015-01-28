class Aura < ActiveRecord::Base
  validates_presence_of :name, :start_date, :end_date
  validates_uniqueness_of :name
  enum status: [:pending, :approved, :live, :denied, :archived]

  belongs_to :job_number, inverse_of: :auras

  rails_admin do
    edit do
      field :job_number, :belongs_to_association
      field :name
      field :start_date
      field :end_date
      field :status
    end

    exclude_fields :id, :created_at, :updated_at
  end

  def status_enum
    ['pending', 'approved', 'live', 'denied', 'archived']
  end
end
