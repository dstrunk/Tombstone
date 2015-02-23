FactoryGirl.define do
  factory :aura_transition do
    to_state "unassigned"
    sort_key 0
    aura

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
