require 'faker'

User.create!(
  email: 'oscarmolivera@gmail.com',
  first_name: 'Oscar',
  last_name: 'Olivera',
  password: '123456',
  password_confirmation: '123456'
)
puts 'My User created!'

8.times do
  pass = Faker::Internet.password(min_length: 8)
  User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: pass,
    password_confirmation: pass
  )
end
puts '8 Dummy users created!'

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

25.times do
  3.times do
    Review.create!(
      comment: Faker::Restaurant.review,
      rating: Faker::Number.between(from: 0, to: 5),
      created_at: Faker::Date.backward(days: 24),
      updated_at: Date.today,
      restaurant_id: Faker::Number.between(from: 1, to: 25),
      user_id: Faker::Number.between(from: 1, to: 9)
    )
  end
end
puts '75 Reviews created! 3 for each restaurant'
