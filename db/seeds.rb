3.times do
  Sighting.create({
    date: Faker::Date.backward(days: 14),
    longitude: Faker::Number.decimal(l_digits: 2, r_digits: 6),
    latitude: Faker::Number.decimal(l_digits: 1, r_digits: 6),
    animal_id: 8
  })
end
