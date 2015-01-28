class AurasController < ApplicationController
  def dashboard
    auras_to_decorate = Aura.all
    @auras = AuraPresenter.new(auras_to_decorate)
  end

  def new
    @aura = Aura.new
  end

  def create
    @aura = Aura.new(aura_params)
    if @aura.save
      redirect_to "dashboard", flash[:notice] = ""
    else
      redirect_to "new", flash.now[:alert] = ""
    end
  end


  private
  def aura_params
    params.require(:aura).permit(:name, :start_date, :end_date)
  end
end
