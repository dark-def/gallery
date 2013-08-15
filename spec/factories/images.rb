# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    title "must be title of image"
    image { File.new(Rails.root + 'app/assets/rails.png')}
  end
end