# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :touch do
    user nil
    item nil
    reaction_type "MyString"
    reaction_id 1
  end
end
