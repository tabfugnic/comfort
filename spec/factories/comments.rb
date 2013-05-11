# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id 1
    content "MyText"
    commentable_type "Topic"
    commentable_id 1
  end
end
