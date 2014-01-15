# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :handle do |n|
      "handle#{n}"
    end

    sequence :name do |n|
      "user#{n}"
    end

    grade [1, 2, 3, 4, 5].sample

    department %w(I E S M C).sample

    sequence :email do |n|
      "user#{n}@example.com"
    end

    factory :invalid_attributes_user do
      handle     nil
      name       nil
      grade      nil
      department nil
    end
  end
end
