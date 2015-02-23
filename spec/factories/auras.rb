FactoryGirl.define do
  factory :aura do
    name "MyString"
    start_date "2015-01-08 09:19:21"
    end_date "2015-01-08 09:19:21"
    ongoing false
    job_number 
    customer
    user

    trait :rejected do
      after(:create) do |aura|
        FactoryGirl.create(:aura_transition, :rejected, aura: aura)
      end
    end

    trait :accepted do
      after(:create) do |aura|
        FactoryGirl.create(:aura_transition, :accepted, aura: aura)
      end
    end

    trait :live do
      after(:create) do |aura|
        FactoryGirl.create(:aura_transition, :live, aura: aura)
      end
    end

    trait :archived do
      after(:create) do |aura|
        FactoryGirl.create(:aura_transition, :archived, aura: aura)
      end
    end
  end
end
