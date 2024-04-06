FactoryBot.define do
    factory :content do
      # Define attributes for the content model
      title { Faker::Lorem.sentence }
      body { Faker::Lorem.paragraph }
      slug {Faker::Alphanumeric.alphanumeric(number: 10) }
      summary {Faker::Lorem.sentence}
      author { FactoryBot.create(:user)}
      # Add other attributes as needed
    end
  end