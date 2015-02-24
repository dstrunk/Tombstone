class AuraMailer < ActionMailer::Base
  default from: "auras@communicorp.com",
    cc: Proc.new { User.where(admin: true).pluck(:email) }

  def aura_submitted(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    headers['X-MC-PreserveRecipients'] = 'true'
    mail(to: @user.email,
         subject: "Your aura request has been submitted - #{@aura.job_num}"
    )
  end

  def aura_approved(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    headers['X-MC-PreserveRecipients'] = 'true'
    mail(to: @user.email, 
         subject: "Your aura request has been approved - #{@aura.job_num}"
    )
  end

  def aura_rejected(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    headers['X-MC-PreserveRecipients'] = 'true'
    mail(to: @user.email, 
         subject: "Your aura request was rejected - #{@aura.job_num}"
    )
  end

  def aura_live(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    headers['X-MC-PreserveRecipients'] = 'true'
    mail(to: @user.email,
         subject: "Your aura request was just released! - #{@aura.job_num}"
    )
  end

  def aura_archived(user, aura)
    @user = user
    @aura = aura
    attachments.inline['tombstone-email-logo.gif'] = File.read("#{Rails.root}/app/assets/images/tombstone-email-logo.gif")
    headers['X-MC-PreserveRecipients'] = 'true'
    mail(to: @user.email,
         subject: "Your aura has been archived - #{@aura.job_num}"
    )
  end
end
