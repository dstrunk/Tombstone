FactoryGirl.define do
  factory :aura do
    name "MyString"
    job_number 1
    start_date "2015-01-08 09:19:21"
    end_date "2015-01-08 09:19:21"
    ongoing false

    trait :unstarted do
      to_state "unstarted"
    end

    trait :rejected do
      to_state "rejected"
    end

    trait :accepted do
      to_state "accepted"
    end

    trait :live do
      to_state "live"
    end

    trait :archived do
      to_state "archived"
    end
  end
end
