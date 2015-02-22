class AuraMailer < ActionMailer::Base
  default from: "auras@communicorp.com"

  def aura_submitted(user, aura)
    @user = user
    @aura = aura
    mail(to: @user.email, subject: "Your aura request has been submitted")
  end
end
