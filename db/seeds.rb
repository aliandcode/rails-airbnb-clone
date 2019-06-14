require 'faker'
require "open-uri"
require "nokogiri"


def faker_address
 array = []
 html_doc = Nokogiri::HTML(open("https://www.fakeaddressgenerator.com/"))
 html_doc.css("input.no-style").each do |element|
    array << element.attributes["value"].value
 end
 return "#{array[0]} #{array[3]}".tr("0-9", "").strip
end


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

array_house = [
  { title: "Light & Spacious Garden Flat London",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/68782390/2dffeb50_original.jpg",
    description: "A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory. Close to Queens park station and all buses. Shops are very nearby as well as nice local restaurants.",
    price: 111,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "Cosy Room Paris Center in the Marais",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/b38d7c58-19f5-41af-b8da-273220ce250e.jpg?aki_policy=xx_large",
    description: "One spacious room in a large modern apparment in the center of Paris, near Georges Pompidou Center. Very calm and luminous room located in one of the oldest streets in Paris .Lots of storage space in the room and a private bath with walk-in shower",

    price: 203,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "Penthouse with terrace in downtown",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/82240269-a742-4059-b111-4cb769e182de.jpg?aki_policy=xx_large",
    description: "A beautiful 5th floor penthouse flat situated right on the trendy and hip quarter of Malasaña, one of Madrid’s liveliest neighbourhoods, an unbeatable location, right in the heart of Madrid.
It i surrouded by a broad selection of trendy restaurants.",

    price: 65,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "JBR Walck Beach Amazing Penthouse",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/218ca05f-d302-4727-9db9-161511421d6c.jpg?aki_policy=xx_large",
    description: "All you need is here!!! You are in the heart of the Beach promenade, just in front the free beach and above to best touristic road of Dubai Marina and Jbr beach walk! Free use of Pools and Gym and Play areas",

    price: 160,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "Apartment Design",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/82509985/d248c3ad_original.jpg?aki_policy=xx_large",
    description: "The JoHouse is a few steps from Navigli, in an old Milan building, furnished with a combination of art, design and elegance, with entrance, living/dining room, double sofa bed, kitchen and bathroom on the lower level; sleeping area on the top level.",

    price: 300,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "Nice room with private bathroom",
    user: User.all.sample,
    imageUrl: "https://dynamicmedia.irvinecompany.com/is/image/content/dam/apartments/3-readytopublish/communities/orangecounty/irvine/parkplace/photography/PPIII-INT-MAY2018-LIVRM-A.tif?&wid=1920&qlt=85&crop=0,483,5700,2375&fit=stretch&iccEmbed=1&icc=AdobeRGB&fmt=pjpeg&pscan=auto",
    description: "Independent room with private bathroom. Complete with many comforts. Italian breakfast is included in the price. We live in a quiet area of Milan, but you can reach the center by public transport within 20 minutes.",

    price: 115,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "TriBeCa 2500 Sq Ft w/ Priv Elevator",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/15619021/d6cf8207_original.jpg?aki_policy=xx_large",
    description: "2500 square feet TriBeCa loft with 13-feet exposed beam ceilings, hardwood floors and over-sized windows. Three bedrooms, two bathrooms, large kitchen, washer/dryer, art, and modern furnishings. We own our building, live on the premises, and are available for assistance at all times. We are in compliance with all local and state rent laws.",

    price: 94,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "Badawi Loft",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/3a4f5528-986c-425f-b1d8-e19207a9874d.jpg?aki_policy=xx_large",
    description: "A spacious one bed loft with extraordinary light, packed with all the amenities one needs for a long or short stay. The space is perfectly renovated and has a modern feel while preserving its old character.",

    price: 69,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
    {

    title: "Charming Studio near the Canal Saint-Martin",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/06a37d7d-d8fd-4b54-8aa8-eab3f5a5ba54.jpg?aki_policy=xx_large",
    description: "This charming studio is situated near the famous Canal Saint-Martin. Ideally situated in an animated neighbourhood from the capital, you'll have access to 3 different subway lines (2, 5 and 7bis) which will allow an easy way to discover Paris.",

    price: 84,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  },
  {

    title: "Private Guest Suite in Top Location",
    user: User.all.sample,
    imageUrl: "https://a0.muscache.com/im/pictures/13804460/5a7bc5f5_original.jpg?aki_policy=xx_large",
    description: "Our modern, cozy guest suite has hardwood floors, a TempraPedic bed, kitchenette and rain-shower in a very private setting, just for you. 5 min away is action packed Hollywood Blvd. Enjoy relaxing surrounded by nature before exploring the city!",

    price: 165,
    priceCurrency: "€",
    bedrooms: rand(1..5),
    capacity: rand(1..5),
    category: "Entire home",
  }
]


array_house.each do |house|

  h = House.new(title: house[:title],
            user: house[:user],
            remote_photo_url: house[:imageUrl],
            description: house[:description],
            address: faker_address,
            price: house[:price],
            bedrooms: house[:bedrooms],
            capacity: rand(1..5),
            category: house[:category])
  h.save!

end

s = %w[pending approved rejected]

45.times do
  booking = Booking.new(
    guests: rand(1..4),
    checkin_date: DateTime.parse("09/01/2009 17:00"),
    checkout_date: DateTime.parse("15/01/2009 17:00"),
    user: User.all.sample,
    house: House.all.sample,
    status: s[rand(0..2)]
  )
  booking.save!
  review = Review.new(
     comment:Faker::Restaurant.review,
    stars: rand(1..5),
    booking: booking
  )
  review.save!
end
