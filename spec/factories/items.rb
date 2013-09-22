# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      "Item#{n}"
    end
  end
end
