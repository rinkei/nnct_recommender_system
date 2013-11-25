# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      "Item#{n}"
    end

    sequence :aim do |n|
      "To improve life."
    end

    sequence :introduction do |n|
      "You should buy Item#{n}!"
    end
  end
end
