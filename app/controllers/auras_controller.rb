class AurasController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def dashboard
    auras_to_decorate = Aura.includes(:job_number, :customer).all
    @auras = AuraPresenter.new(auras_to_decorate)

    gon.rabl "app/views/auras/timeline.json.rabl", as: "auras"
  end

  def new
    @aura = AuraForm.new
  end

  def create
    @aura = AuraForm.new(aura_params)
    if @aura.save
      redirect_to root_path
      flash[:notice] = "Your request has been submitted! We'll get back to you shortly."
    else
      render :new
      flash.now[:notice] = "Something went wrong. Please try again."
    end
  end

  def show
    @aura = Aura.find(params[:id])
  end

  private
  def aura_params
    params.require(:aura_form).permit(:aura_name, :description, :job_number, :customer,
                                 :start_date, :end_date, :new_job_number,
                                 :new_customer_name).merge(user_id: current_user.id)
  end

end
