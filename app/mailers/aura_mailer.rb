class AuraMailer < ActionMailer::Base
  admin_array = []
  admins = User.where(admin: true).each { |u| admin_array.push(u.email) }

  default from: "auras@communicorp.com",
          cc: admin_array,
          return_path: admin_array

  def aura_submitted(user, aura)
    @user = user
    @aura = aura
    mail(to: @user.email, subject: "Your aura request has been submitted")
  end

  def aura_approved(user, aura)
    @user = user
    @aura = aura
    mail(to: @user.email, subject: "Your aura request has been approved")
  end

  def aura_rejected(user, aura)
    @user = user
    @aura = aura
    mail(to: @user.email, subject: "Your aura request was rejected")
  end

  def aura_live(user, aura)
    @user = user
    @aura = aura
    mail(to: @user.email, subject: "Your aura request was just released!")
  end

  def aura_archived(user, aura)
    @user = user
    @aura = aura
    mail(to: @user.email, subject: "Your aura has been archived")
  end
end
