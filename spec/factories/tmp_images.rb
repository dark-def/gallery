# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tmp_image, :class => 'TmpImages' do
    title "MyString"
    image "MyString"
  end
end
