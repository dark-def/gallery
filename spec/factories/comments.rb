# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    description 'Simple comment'
    user_id 1
  end
end