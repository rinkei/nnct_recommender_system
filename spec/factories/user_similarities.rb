# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_similarity do
    user_id nil
    target_id nil
    value 0.5
  end
end
