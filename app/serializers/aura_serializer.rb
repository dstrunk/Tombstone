class AuraSerializer < ActiveModel::Serializer
  attributes :name

  belongs_to :job_number
  belongs_to :status
end
