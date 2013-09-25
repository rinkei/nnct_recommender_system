# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    item nil
    user nil
    type "GeneralRating"
    score 1
  end
end
