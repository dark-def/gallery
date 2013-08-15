# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'drkmen'
    email 'drkmen@rambler.ru'
    password "123456789"
    password_confirmation { |u| u.password }
  end
end
