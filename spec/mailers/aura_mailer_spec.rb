require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

RSpec.describe AuraMailer, type: :mailer do
  
  describe "#aura_submitted" do
    it "notifies the user and admins" do
      user = FactoryGirl.build(:user)
      aura = FactoryGirl.build(:aura)

      mail = AuraMailer.aura_submitted(user, aura)

      expect(mail.body.encoded).to include("You've submitted an aura")
      expect { mail }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end
  
  describe "#aura_approved" do
    it "notifies the user and admins" do
      user = FactoryGirl.build(:user)
      aura = FactoryGirl.build(:aura)

      mail = AuraMailer.aura_approved(user, aura)

      expect(mail.body.encoded).to include("Your aura was approved")
      expect { mail }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end
  
  describe "#aura_rejected" do
    it "notifies the user and admins" do
      user = FactoryGirl.build(:user)
      aura = FactoryGirl.build(:aura)

      mail = AuraMailer.aura_rejected(user, aura)

      expect(mail.body.encoded).to include("Your aura was rejected")
      expect { mail }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end
  
  describe "#aura_live" do
    it "notifies the user and admins" do
      user = FactoryGirl.build(:user)
      aura = FactoryGirl.build(:aura)

      mail = AuraMailer.aura_live(user, aura)
      
      expect(mail.body.encoded).to include("Your aura is now live")
      expect { mail }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end
  
  describe "#aura_archived" do
    it "notifies the user and admins" do
      user = FactoryGirl.build(:user)
      aura = FactoryGirl.build(:aura)

      mail = AuraMailer.aura_archived(user, aura)

      expect(mail.body.encoded).to include("Your aura has been archived")
      expect { mail }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end

  describe "#aura_ending_soon" do
    it "notifies the user and admins" do
      user = FactoryGirl.build(:user)
      aura = FactoryGirl.build(:aura)

      mail = AuraMailer.aura_ending_soon(user, aura)

      expect(mail.body.encoded).to include("Your aura is ending soon")
      expect { mail }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end
end
