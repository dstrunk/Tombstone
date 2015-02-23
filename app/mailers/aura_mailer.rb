class AuraMailer < ActionMailer::Base
  admin_array = []
  admins = User.where(admin: true).each { |u| admin_array.push(u.email) }

  default from: "auras@communicorp.com"
  default cc: admin_array

  def aura_submitted(user, aura)
    @user = user
    @aura = aura
    mail(to: @user.email, subject: "Your aura request has been submitted")
  end
end
