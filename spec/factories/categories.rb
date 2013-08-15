FactoryGirl.define do
  factory :category do
    sequence :title do |f|
      "Category#{f}"
    end
  end
end