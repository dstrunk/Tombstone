class AuraMailer < ActionMailer::Base
  @admin_array = []
  admins = User.where(admin: true).each { |u| @admin_array.push(u.email) }

  default from: "auras@communicorp.com", return_path: @admin_array

  def aura_submitted(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    mail(to: @user.email, cc: @admin_array, subject: "Your aura request has been submitted - #{@aura.job_num}")
  end

  def aura_approved(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    mail(to: @user.email, cc: @admin_array, subject: "Your aura request has been approved - #{@aura.job_num}")
  end

  def aura_rejected(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    mail(to: @user.email, cc: @admin_array, subject: "Your aura request was rejected - #{@aura.job_num}")
  end

  def aura_live(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    mail(to: @user.email, cc: @admin_array, subject: "Your aura request was just released! - #{@aura.job_num}")
  end

  def aura_archived(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    mail(to: @user.email, cc: @admin_array, subject: "Your aura has been archived - #{@aura.job_num}")
  end
end
