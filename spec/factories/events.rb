# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user_id 1
    event 'event'
    url 'localhost:3000'
  end
end
