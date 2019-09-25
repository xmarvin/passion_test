FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
    vertical { create(:vertical) }
  end
end