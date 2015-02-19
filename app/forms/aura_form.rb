class AuraForm
  include ActiveModel::Model

  attr_accessor(
    :aura_name,
    :description,
    :job_number,
    :customer,
    :start_date,
    :end_date,
    :new_job_number,
    :new_customer_name
  )

  validates :aura_name, presence: true
  validates :description, presence: true
  validates :customer, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def save
    if valid?
      @aura = Aura.create(
        name: aura_name,
        description: description,
        start_date: Date.new(flatten_date_array(aura, start_date)), 
        end_date: Date.new(flatten_date_array(aura, end_date))
      )
      @aura.customer.where(name: customer).first_or_create
      @aura.job_number.where(number: job_number).first_or_create
    end
  end

  private

end
