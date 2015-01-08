class Aura < ActiveRecord::Base
  validates_presence_of :name, :start_date, :end_date, :status_id, :job_number_id 
  validates_uniqueness_of :name

  belongs_to :job_number, inverse_of: :auras
  belongs_to :status, inverse_of: :auras

  rails_admin do
    edit do
      field :job_number, :belongs_to_association
      field :name
      field :start_date
      field :end_date
      field :status, :belongs_to_association
    end

    exclude_fields :id, :created_at, :updated_at
  end
end
