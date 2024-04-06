FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      password { 'password' }  # Change this if you have password requirements
    end
  end
  