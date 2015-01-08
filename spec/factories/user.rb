FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "hunter12"

    factory :admin do
      admin true
    end
  end
end
