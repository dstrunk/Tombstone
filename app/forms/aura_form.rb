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
    :new_customer_name,
    :user_id
  )

  validates :aura_name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def save
    if valid?
      create_aura
      create_or_add_customer
      create_or_add_job_number
      @aura.save!
      AuraMailer.aura_submitted(@aura.user, @aura).deliver_later
    end
  end

  private

  def create_aura
    @aura = Aura.create(
      name: "#{aura_name}",
      description: "#{description}",
      start_date: Date.strptime("#{start_date}", "%m-%d-%Y"),
      end_date: Date.strptime("#{end_date}", "%m-%d-%Y")
    )
    current_user = User.find("#{user_id}")
    current_user.auras << @aura
  end

  def create_or_add_customer
    if new_customer_name && new_customer_name != ""
      aura_customer = Customer.create(name: new_customer_name)
      @aura.customer = aura_customer
    else
      aura_customer = Customer.find(customer)
      @aura.customer = aura_customer
    end
  end

  def create_or_add_job_number
    if new_job_number && new_job_number != ""
      aura_job_number = JobNumber.create(number: new_job_number.to_i)
      @aura.job_number = aura_job_number
    else
      aura_job_number = JobNumber.find(job_number)
      @aura.job_number = aura_job_number
    end
  end

end
