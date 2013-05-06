# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    user
    topic
    sequence(:comfort) {|n| rand(100) }
    sequence(:interest) {|n| rand(100) }
  end

end
