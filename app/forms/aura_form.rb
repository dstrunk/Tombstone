class AuraForm
  include ActiveModel::Model

  attr_accessor(
    :aura_name,
    :job_number,
    :customer,
    :description
  )

  validates :aura_name, presence: true
  validates :description, presence: true

  def submit
    if valid?
      create_aura
      associate_job_number
    end
  end

  private
  
  def create_aura
    aura = Aura.new(params[:aura_form])
  end

  def associate_job_number(aura)
    @job_number = JobNumber.where(number: params[:job_number]).first_or_create
    aura << job_number
  end

  def associate_customer(aura)
    customer = Customer.where(name: params[:customer]).first_or_create
    aura << customer
  end
end
