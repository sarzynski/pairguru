FactoryBot.define do
  factory :user do
    sequence :name do |n|
      "user#{n}"
    end
    sequence :email do |n|
      "#{name}@example.com"
    end
    confirmed_at { Time.zone.now }
    password 'password'
  end
end
