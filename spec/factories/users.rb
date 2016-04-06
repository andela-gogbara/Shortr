FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password "password"
    api_key "testkey"
  end
end
