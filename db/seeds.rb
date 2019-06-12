require 'faker'

Review.destroy_all
Booking.destroy_all
House.destroy_all
User.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end


25.times do
  house = House.new(
    title: Faker::JapaneseMedia::DragonBall.character,
    user: User.all.sample,
    bedrooms: 1,
    capacity: 1,
    category: "Entire_home"
  )
  house.save!
end

45.times do
  booking = Booking.new(
    guests: rand(1..4),
    checkin_date: DateTime.parse("09/01/2009 17:00"),
    checkout_date: DateTime.parse("15/01/2009 17:00"),
    user: User.all.sample,
    house: House.all.sample
  )
  booking.save!
  review = Review.new(
     comment:Faker::Restaurant.review,
    stars: rand(1..5),
    booking: booking
  )
  review.save!
end


