FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph(1) }
    movie
    user
  end
end
