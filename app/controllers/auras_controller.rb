class AurasController < ApplicationController
  def dashboard
    auras_to_decorate = Aura.all
    @auras = AuraPresenter.new(auras_to_decorate)
  end
end
