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


10.times do
  house = House.new(
    title: Faker::JapaneseMedia::DragonBall.character,
    user: User.all.sample
  )
  house.save!
end

10.times do
  booking = Booking.new(
    guests: 2,
    checkin_date: DateTime.parse("09/01/2009 17:00"),
    checkout_date: DateTime.parse("15/01/2009 17:00"),
    user: User.all.sample,
    house: House.all.sample
  )
  booking.save!
end

15.times do
  review = Review.new(
    comment:"very very nice",
    stars: rand(1..5),
    booking: Booking.all.sample
  )
  review.save
end
