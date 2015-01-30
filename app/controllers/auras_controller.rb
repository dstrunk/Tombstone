class AurasController < ApplicationController
  def dashboard
    auras_to_decorate = Aura.all
    @auras = AuraPresenter.new(auras_to_decorate)

    gon.rabl "app/views/auras/timeline.json.rabl", as: "auras"
  end

  def new
    @aura = Aura.new
  end

  def create
    @aura = Aura.new(aura_params)
    @aura.status = "pending"

    if @aura.save
      redirect_to "dashboard"
      flash[:notice] = "Your request has been submitted! We'll get back to you shortly."
    else
      redirect_to "new"
      flash.now[:alert] = "Something went wrong. Please try again."
    end
  end


  private
  def aura_params
    params.require(:aura).permit(:name, :start_date, :end_date)
  end
end
