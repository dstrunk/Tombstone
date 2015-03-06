FactoryGirl.define do
  factory :user do
    email "myemail@example.com"
    password "hunter12"

    factory :admin do
      admin true
    end
  end
end
