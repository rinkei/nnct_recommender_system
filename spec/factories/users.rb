# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    password "password"
    password_confirmation "password"
    password_digest "MyString"
  end
end
