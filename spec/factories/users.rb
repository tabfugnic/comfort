# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Eric"
    last_name "Collins"
    sequence(:email) { |n| "eric-#{n}@example.com" }
    avatar "any-ol-thing.png"
    sequence(:uid) { |n| n }
    provider :google_oauth2
  end
end
