class JobNumber < ActiveRecord::Base
  validates_uniqueness_of :number
  has_many :auras

  rails_admin do
    edit do
      field :number do
        label "Job number"
      end
    end

    exclude_fields :id, :created_at, :updated_at
  end

  def name
    number
  end
end
