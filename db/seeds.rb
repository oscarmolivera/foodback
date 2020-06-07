require 'faker'
8.times do
  Category.create!(
    name: Faker::Restaurant.type
  )
end

puts '8 Categories Created!'
25.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    address1: "#{Faker::Address.street_address} #{Faker::Address.community}",
    address2: "#{Faker::Address.street_address} #{Faker::Address.community}",
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    email: Faker::Internet.email,
    category_id: Faker::Number.between(from: 1, to: 8)
  )
end

puts '25 Restaurants Created!'
