cars = [
  { brand: "Volkswagen", name: "Gol",     model: "G6",    year: 2015 },
  { brand: "Volkswagen", name: "Gol",     model: "G5",    year: 2012 },
  { brand: "Honda",      name: "Civic",   model: "EXL",   year: 2022 },
  { brand: "Honda",      name: "Civic",   model: "Sport", year: 2021 },
  { brand: "BYD",        name: "Dolphin", model: "Plus",  year: 2024 },
  { brand: "BYD",        name: "Dolphin", model: "GS",    year: 2024 }
]

cars.each do |attrs|
  Car.find_or_create_by!(attrs)
end
