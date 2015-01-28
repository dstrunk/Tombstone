class AuraMailer < ActionMailer::Base
  default from: "auras@communicorp.com"

  def submit(user)
    @user = user
    mail(to: @user.email, subject: "Your Aura request has been submitted")
  end
end
