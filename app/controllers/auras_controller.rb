class AurasController < ApplicationController
  def dashboard
    auras_to_decorate = Aura.includes(:job_number, :customer).all
    @auras = AuraPresenter.new(auras_to_decorate)

    gon.rabl "app/views/auras/timeline.json.rabl", as: "auras"
  end

  def new
    @aura = AuraForm.new
  end

  def create
    @aura = AuraForm.new(params[:aura_form])
    if @aura.save
      redirect_to "dashboard"
      flash[:notice] = "Your request has been submitted! We'll get back to you shortly."
    else
      redirect_to "new"
      flash.now[:alert] = "Something went wrong. Please try again."
    end
  end

end
