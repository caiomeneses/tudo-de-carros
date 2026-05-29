# Limpa na ordem correta (filhos antes dos pais) para evitar duplicatas no re-seed
[FipePrice, Maintenance, Defect, Review, TechnicalSpec, Vehicle, Brand].each(&:destroy_all)

vehicles_data = [
  {
    brand: "Toyota",
    name: "Corolla", version: "XEi 2.0 Flex", year: 2022, launch_price: 154_990.00,
    spec: { engine: "2.0 Flex", horsepower: 177, torque_kgfm: 19.4, fuel_type: "Flex", transmission: "CVT", drivetrain: "Dianteira", city_consumption: 11.5, highway_consumption: 13.2, trunk_liters: 371 },
    prices: [ { price: 142_900.00, month: "2026-05-01", code: "005340-9" }, { price: 144_500.00, month: "2026-04-01", code: "005340-9" } ],
    maintenances: [ { km: 10_000, cost: 450 }, { km: 20_000, cost: 780 }, { km: 40_000, cost: 1_200 } ],
    defects: [ { desc: "Falha no sensor de estacionamento", freq: "alta" }, { desc: "Ruído na suspensão dianteira", freq: "media" } ],
    reviews: [ { rating: 4.5, comment: "Ótimo custo-benefício" }, { rating: 4.0, comment: "Consumo de combustível dentro do esperado" } ]
  },
  {
    brand: "Toyota",
    name: "Corolla", version: "GLi 1.8 Flex", year: 2020, launch_price: 109_990.00,
    spec: { engine: "1.8 Flex", horsepower: 140, torque_kgfm: 17.7, fuel_type: "Flex", transmission: "CVT", drivetrain: "Dianteira", city_consumption: 12.1, highway_consumption: 14.5, trunk_liters: 371 },
    prices: [ { price: 118_900.00, month: "2026-05-01", code: "005339-2" } ],
    maintenances: [ { km: 10_000, cost: 420 }, { km: 20_000, cost: 700 } ],
    defects: [],
    reviews: [ { rating: 4.2, comment: "Muito confiável" } ]
  },
  {
    brand: "Honda",
    name: "Civic", version: "EXL 1.5 Turbo", year: 2023, launch_price: 189_990.00,
    spec: { engine: "1.5 Turbo Flex", horsepower: 174, torque_kgfm: 22.4, fuel_type: "Flex", transmission: "CVT", drivetrain: "Dianteira", city_consumption: 10.8, highway_consumption: 13.6, trunk_liters: 519 },
    prices: [ { price: 168_900.00, month: "2026-05-01", code: "015752-3" }, { price: 165_000.00, month: "2026-04-01", code: "015752-3" } ],
    maintenances: [ { km: 10_000, cost: 480 }, { km: 20_000, cost: 850 }, { km: 40_000, cost: 1_400 } ],
    defects: [ { desc: "Consumo de óleo acima do normal", freq: "media" } ],
    reviews: [ { rating: 4.7, comment: "Porta-malas enorme" }, { rating: 4.5, comment: "Motor turbo muito responsivo" } ]
  },
  {
    brand: "Volkswagen",
    name: "Gol", version: "1.6 MSI", year: 2019, launch_price: 52_990.00,
    spec: { engine: "1.6 Flex", horsepower: 104, torque_kgfm: 15.5, fuel_type: "Flex", transmission: "Manual 5 marchas", drivetrain: "Dianteira", city_consumption: 10.2, highway_consumption: 13.8, trunk_liters: 285 },
    prices: [ { price: 64_900.00, month: "2026-05-01", code: "025040-1" } ],
    maintenances: [ { km: 10_000, cost: 320 }, { km: 20_000, cost: 580 } ],
    defects: [ { desc: "Desgaste prematuro das velas de ignição", freq: "alta" }, { desc: "Travamento do vidro elétrico", freq: "baixa" } ],
    reviews: [ { rating: 3.8, comment: "Barato de manter" } ]
  },
  {
    brand: "BYD",
    name: "Dolphin", version: "Plus", year: 2024, launch_price: 199_800.00,
    spec: { engine: "Elétrico", horsepower: 204, torque_kgfm: 31.0, fuel_type: "Elétrico", transmission: "Monovelocidade", drivetrain: "Dianteira", city_consumption: nil, highway_consumption: nil, trunk_liters: 345 },
    prices: [ { price: 189_800.00, month: "2026-05-01", code: "028001-7" }, { price: 192_000.00, month: "2026-04-01", code: "028001-7" } ],
    maintenances: [ { km: 20_000, cost: 200 }, { km: 40_000, cost: 350 } ],
    defects: [ { desc: "Instabilidade no aplicativo de carregamento", freq: "media" } ],
    reviews: [ { rating: 4.8, comment: "Melhor custo por km" }, { rating: 4.6, comment: "Incrivelmente barato para manter" } ]
  }
]

vehicles_data.each do |data|
  brand = Brand.find_or_create_by!(name: data[:brand])

  vehicle = Vehicle.find_or_create_by!(
    brand: brand, name: data[:name], version: data[:version], year: data[:year]
  )
  vehicle.update!(launch_price: data[:launch_price])

  if vehicle.technical_spec
    s = data[:spec]
    vehicle.technical_spec.update!(
      engine: s[:engine], horsepower: s[:horsepower], torque_kgfm: s[:torque_kgfm],
      fuel_type: s[:fuel_type], transmission: s[:transmission], drivetrain: s[:drivetrain],
      city_consumption: s[:city_consumption], highway_consumption: s[:highway_consumption],
      trunk_liters: s[:trunk_liters], source: "seed"
    )
  else
    s = data[:spec]
    vehicle.create_technical_spec!(
      engine: s[:engine], horsepower: s[:horsepower], torque_kgfm: s[:torque_kgfm],
      fuel_type: s[:fuel_type], transmission: s[:transmission], drivetrain: s[:drivetrain],
      city_consumption: s[:city_consumption], highway_consumption: s[:highway_consumption],
      trunk_liters: s[:trunk_liters], source: "seed"
    )
  end

  data[:prices].each do |p|
    vehicle.fipe_prices.find_or_create_by!(reference_month: p[:month]) do |fp|
      fp.price = p[:price]
      fp.fipe_code = p[:code]
      fp.fuel_type = data[:spec][:fuel_type]
    end
  end

  data[:maintenances].each do |m|
    vehicle.maintenances.find_or_create_by!(km_interval: m[:km]) do |rec|
      rec.avg_cost = m[:cost]
      rec.source = "seed"
    end
  end

  data[:defects].each do |d|
    vehicle.defects.find_or_create_by!(description: d[:desc]) do |rec|
      rec.frequency = d[:freq]
      rec.source = "seed"
    end
  end

  data[:reviews].each do |r|
    vehicle.reviews.find_or_create_by!(comment: r[:comment]) do |rec|
      rec.rating = r[:rating]
      rec.source = "seed"
    end
  end

  puts "#{brand.name} #{vehicle.name} #{vehicle.version} (#{vehicle.year}) ✓"
end
