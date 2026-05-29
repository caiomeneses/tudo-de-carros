# Limpa na ordem correta (filhos antes dos pais) para evitar duplicatas no re-seed
[FipePrice, Maintenance, Defect, Review, EvSpec, TechnicalSpec, Vehicle, Brand].each(&:destroy_all)

vehicles_data = [
  {
    brand: "Toyota",
    name: "Corolla", version: "XEi 2.0 Flex", year: 2022, launch_price: 154_990.00,
    spec: {
      engine: "2.0 Flex", cylinders: 4, valves: 16, engine_displacement_cc: 1_987, engine_cycle: "Otto",
      fuel_type: "Flex", horsepower: 177, torque_nm: 190, torque_kgfm: 19.4,
      transmission: "CVT", drivetrain: "Dianteira", steering_type: "Elétrica",
      top_speed_kmh: 185, acceleration_0_100: 9.1,
      length_mm: 4_630, width_mm: 1_780, height_mm: 1_435, wheelbase_mm: 2_700,
      ground_clearance_mm: 150, curb_weight_kg: 1_370, tire_size: "205/55 R16",
      front_suspension: "McPherson", rear_suspension: "Multilink",
      front_brake: "Discos ventilados", rear_brake: "Discos sólidos",
      trunk_liters: 371, fuel_tank_liters: 50,
      city_consumption: 11.5, highway_consumption: 13.2,
      city_consumption_ethanol: 8.2,  highway_consumption_ethanol: 9.8,
    },
    prices: [ { price: 142_900.00, month: "2026-05-01", code: "005340-9" }, { price: 144_500.00, month: "2026-04-01", code: "005340-9" } ],
    maintenances: [ { km: 10_000, cost: 450 }, { km: 20_000, cost: 780 }, { km: 40_000, cost: 1_200 } ],
    defects: [ { desc: "Falha no sensor de estacionamento", freq: "alta" }, { desc: "Ruído na suspensão dianteira", freq: "media" } ],
    reviews: [ { rating: 4.5, comment: "Ótimo custo-benefício" }, { rating: 4.0, comment: "Consumo de combustível dentro do esperado" } ]
  },
  {
    brand: "Toyota",
    name: "Corolla", version: "GLi 1.8 Flex", year: 2020, launch_price: 109_990.00,
    spec: {
      engine: "1.8 Flex", cylinders: 4, valves: 16, engine_displacement_cc: 1_798, engine_cycle: "Otto",
      fuel_type: "Flex", horsepower: 140, torque_nm: 174, torque_kgfm: 17.7,
      transmission: "CVT", drivetrain: "Dianteira", steering_type: "Elétrica",
      top_speed_kmh: 180, acceleration_0_100: 10.5,
      length_mm: 4_630, width_mm: 1_780, height_mm: 1_435, wheelbase_mm: 2_700,
      ground_clearance_mm: 150, curb_weight_kg: 1_320, tire_size: "195/65 R15",
      front_suspension: "McPherson", rear_suspension: "Multilink",
      front_brake: "Discos ventilados", rear_brake: "Discos sólidos",
      trunk_liters: 371, fuel_tank_liters: 50,
      city_consumption: 12.1, highway_consumption: 14.5,
      city_consumption_ethanol: 8.6,  highway_consumption_ethanol: 10.3,
    },
    prices: [ { price: 118_900.00, month: "2026-05-01", code: "005339-2" } ],
    maintenances: [ { km: 10_000, cost: 420 }, { km: 20_000, cost: 700 } ],
    defects: [],
    reviews: [ { rating: 4.2, comment: "Muito confiável" } ]
  },
  {
    brand: "Honda",
    name: "Civic", version: "EXL 1.5 Turbo", year: 2023, launch_price: 189_990.00,
    spec: {
      engine: "1.5 Turbo Flex", cylinders: 4, valves: 16, engine_displacement_cc: 1_498, engine_cycle: "Otto",
      fuel_type: "Flex", horsepower: 174, torque_nm: 220, torque_kgfm: 22.4,
      transmission: "CVT", drivetrain: "Dianteira", steering_type: "Elétrica",
      top_speed_kmh: 205, acceleration_0_100: 8.0,
      length_mm: 4_674, width_mm: 1_802, height_mm: 1_415, wheelbase_mm: 2_730,
      ground_clearance_mm: 135, curb_weight_kg: 1_380, tire_size: "235/40 R18",
      front_suspension: "McPherson", rear_suspension: "Multilink",
      front_brake: "Discos ventilados", rear_brake: "Discos sólidos",
      trunk_liters: 519, fuel_tank_liters: 47,
      city_consumption: 10.8, highway_consumption: 13.6,
      city_consumption_ethanol: 7.7,  highway_consumption_ethanol: 9.7,
    },
    prices: [ { price: 168_900.00, month: "2026-05-01", code: "015752-3" }, { price: 165_000.00, month: "2026-04-01", code: "015752-3" } ],
    maintenances: [ { km: 10_000, cost: 480 }, { km: 20_000, cost: 850 }, { km: 40_000, cost: 1_400 } ],
    defects: [ { desc: "Consumo de óleo acima do normal", freq: "media" } ],
    reviews: [ { rating: 4.7, comment: "Porta-malas enorme" }, { rating: 4.5, comment: "Motor turbo muito responsivo" } ]
  },
  {
    brand: "Volkswagen",
    name: "Gol", version: "1.6 MSI", year: 2019, launch_price: 52_990.00,
    spec: {
      engine: "1.6 Flex", cylinders: 4, valves: 8, engine_displacement_cc: 1_598, engine_cycle: "Otto",
      fuel_type: "Flex", horsepower: 104, torque_nm: 152, torque_kgfm: 15.5,
      transmission: "Manual 5 marchas", drivetrain: "Dianteira", steering_type: "Hidráulica",
      top_speed_kmh: 165, acceleration_0_100: 12.5,
      length_mm: 3_972, width_mm: 1_660, height_mm: 1_463, wheelbase_mm: 2_470,
      ground_clearance_mm: 158, curb_weight_kg: 1_040, tire_size: "175/70 R13",
      front_suspension: "McPherson", rear_suspension: "Semi-independente",
      front_brake: "Discos ventilados", rear_brake: "Tambores",
      trunk_liters: 285, fuel_tank_liters: 54,
      city_consumption: 10.2, highway_consumption: 13.8,
      city_consumption_ethanol: 7.3,  highway_consumption_ethanol: 9.9,
    },
    prices: [ { price: 64_900.00, month: "2026-05-01", code: "025040-1" } ],
    maintenances: [ { km: 10_000, cost: 320 }, { km: 20_000, cost: 580 } ],
    defects: [ { desc: "Desgaste prematuro das velas de ignição", freq: "alta" }, { desc: "Travamento do vidro elétrico", freq: "baixa" } ],
    reviews: [ { rating: 3.8, comment: "Barato de manter" } ]
  },
  {
    brand: "BYD",
    name: "Dolphin", version: "Plus", year: 2026, launch_price: 199_800.00,
    exterior_colors: [ "Delan Black", "Ski White" ],
    interior_colors: [ "Dark Black" ],
    ev_spec: {
      powertrain_type:         "BEV",
      battery_type:            "Blade (LFP)",
      battery_capacity_kwh:    60.48,
      range_km_inmetro:        330,
      range_km_wltp:           nil,
      ac_charging_kw:          7.0,
      ac_charging_port:        "Tipo 2",
      ac_charging_time_0_100_min: nil,
      dc_charging_kw:          80.0,
      dc_charging_port:        "CCS 2",
      dc_charging_time_30_80_min: 30,
    },
    spec: {
      engine: "Motor elétrico síncrono de ímã permanente",
      fuel_type: "Elétrico", horsepower: 204, torque_nm: 310, torque_kgfm: 31.6,
      transmission: "Monovelocidade", drivetrain: "Dianteira (FWD)", steering_type: "Elétrica (C-EPS)",
      top_speed_kmh: 160, acceleration_0_100: 7.0,
      length_mm: 4_290, width_mm: 1_770, height_mm: 1_570, wheelbase_mm: 2_700,
      front_track_mm: 1_530, rear_track_mm: 1_530, ground_clearance_mm: 150,
      curb_weight_kg: 1_672, gross_weight_kg: 2_068,
      tire_size: "205/50 R17", front_suspension: "McPherson",
      rear_suspension: "Independente Multilink",
      front_brake: "Discos ventilados", rear_brake: "Discos sólidos",
      trunk_liters: 345,
      city_consumption: nil, highway_consumption: nil,
      city_consumption_ethanol:  nil, highway_consumption_ethanol:  nil,
    },
    prices: [ { price: 189_800.00, month: "2026-05-01", code: "028001-7" }, { price: 192_000.00, month: "2026-04-01", code: "028001-7" } ],
    maintenances: [ { km: 20_000, cost: 200 }, { km: 40_000, cost: 350 } ],
    defects: [ { desc: "Instabilidade no aplicativo de carregamento", freq: "media" } ],
    reviews: [ { rating: 4.8, comment: "Melhor custo por km" }, { rating: 4.6, comment: "Incrivelmente barato para manter" } ]
  },
  {
    brand: "GWM",
    name: "Haval H6", version: "PHEV19", year: 2026, launch_price: 249_990.00,
    exterior_colors: [ "Branco Ágata", "Preto Hematita", "Cinza Diamante" ],
    interior_colors: [ "Preto" ],
    ev_spec: {
      powertrain_type:         "PHEV",
      battery_type:            "LFP",
      battery_capacity_kwh:    19.0,
      range_km_inmetro:        73,
      range_km_wltp:           115,
      ac_charging_kw:          6.6,
      ac_charging_port:        "Tipo 2",
      ac_charging_time_0_100_min: 180,
      dc_charging_kw:          33.0,
      dc_charging_port:        "CCS 2",
      dc_charging_time_30_80_min: 28,
    },
    spec: {
      engine: "1.5 Turbo injeção direta à gasolina", cylinders: 4, valves: 16, engine_displacement_cc: 1_500, engine_cycle: "Atkinson",
      fuel_type: "PHEV", horsepower: 326, torque_nm: 540, torque_kgfm: 55.0,
      transmission: "2 velocidades", drivetrain: "Dianteira", steering_type: "Elétrica",
      top_speed_kmh: 180, acceleration_0_100: 7.6,
      length_mm: 4_703, width_mm: 1_886, height_mm: 1_730, wheelbase_mm: 2_738,
      ground_clearance_mm: 200, curb_weight_kg: 1_915,
      tire_size: "235/55 R19",
      front_suspension: "Independente McPherson", rear_suspension: "Independente Multilink",
      front_brake: "Discos ventilados", rear_brake: "Discos ventilados",
      trunk_liters: 560, trunk_liters_folded: 1_445, fuel_tank_liters: 55,
      max_towing_kg: 750, approach_angle: 22.0, departure_angle: 30.0,
      city_consumption: 13.5, highway_consumption: 11.9,
      city_consumption_ethanol:  nil,  highway_consumption_ethanol:  nil,
    },
    prices: [ { price: 249_990.00, month: "2026-05-01", code: "031005-2" } ],
    maintenances: [ { km: 10_000, cost: 380 }, { km: 20_000, cost: 650 }, { km: 40_000, cost: 1_100 } ],
    defects: [],
    reviews: [ { rating: 4.6, comment: "Melhor SUV híbrido pelo preço" }, { rating: 4.4, comment: "Autonomia elétrica surpreende no dia a dia" } ]
  },
  {
    brand: "Leapmotor",
    name: "C10", version: "BEV", year: 2026, launch_price: 269_990.00,
    exterior_colors: [ "Cinza Noturno", "Cinza Tundra", "Preto Eclipse", "Branco Alvorada", "Verde Boreal" ],
    interior_colors: [ "Preto" ],
    ev_spec: {
      powertrain_type:            "BEV",
      battery_type:               "LFP",
      battery_capacity_kwh:       69.9,
      range_km_inmetro:           338,
      range_km_wltp:              420,
      range_km_total:             nil,
      ac_charging_kw:             11.0,
      ac_charging_port:           "Tipo 2",
      ac_charging_time_0_100_min: nil,
      ac_charging_time_30_80_min: 234,   # 3,9h × 60
      dc_charging_kw:             84.0,
      dc_charging_port:           "CCS 2",
      dc_charging_time_30_80_min: 30,
    },
    spec: {
      engine: "Motor elétrico síncrono de ímã permanente",
      fuel_type: "Elétrico", horsepower: 218, torque_nm: 320, torque_kgfm: 32.6,
      transmission: "Ligação direta ao diferencial", drivetrain: "Traseira", steering_type: "Elétrica",
      top_speed_kmh: 170, acceleration_0_100: 8.3,
      length_mm: 4_739, width_mm: 1_900, height_mm: 1_680, wheelbase_mm: 2_825,
      ground_clearance_mm: 180, curb_weight_kg: 2_007,
      tire_size: "245/45 R20",
      front_suspension: "Independente McPherson", rear_suspension: "Independente Multibraço",
      front_brake: "Discos ventilados", rear_brake: "Discos ventilados",
      trunk_liters: 465, approach_angle: 17.0, departure_angle: 23.0,
      city_consumption: nil, highway_consumption: nil,
      city_consumption_ethanol:  nil, highway_consumption_ethanol:  nil,
    },
    prices: [ { price: 269_990.00, month: "2026-05-01", code: "032001-4" } ],
    maintenances: [ { km: 20_000, cost: 180 }, { km: 40_000, cost: 320 } ],
    defects: [],
    reviews: [ { rating: 4.5, comment: "SUV elétrico mais espaçoso da categoria" }, { rating: 4.3, comment: "Autonomia real surpreende no interior" } ]
  },
  {
    brand: "Leapmotor",
    name: "C10", version: "REEV", year: 2026, launch_price: 249_990.00,
    exterior_colors: [],
    interior_colors: [],
    ev_spec: {
      powertrain_type:            "REEV",
      battery_type:               "LFP",
      battery_capacity_kwh:       28.4,
      range_km_inmetro:           111,
      range_km_wltp:              nil,
      range_km_total:             950,
      ac_charging_kw:             6.6,
      ac_charging_port:           "Tipo 2",
      ac_charging_time_0_100_min: nil,
      ac_charging_time_30_80_min: 180,   # 3h (30% a 80%)
      dc_charging_kw:             65.0,
      dc_charging_port:           "CCS 2",
      dc_charging_time_30_80_min: 18,
    },
    spec: {
      engine: "Motor elétrico síncrono de ímã permanente + gerador 1.5 ciclo Atkinson",
      cylinders: 4, valves: 16, engine_displacement_cc: 1_499, engine_cycle: "Atkinson",
      fuel_type: "REEV", horsepower: 215, torque_nm: 320, torque_kgfm: 32.6,
      transmission: "Ligação direta ao diferencial", drivetrain: "Traseira", steering_type: "Elétrica",
      fuel_tank_liters: 50, top_speed_kmh: 170, acceleration_0_100: 8.2,
      length_mm: 4_739, width_mm: 1_900, height_mm: 1_680, wheelbase_mm: 2_825,
      ground_clearance_mm: 180, curb_weight_kg: 1_976,
      tire_size: "245/45 R20",
      front_suspension: "Independente McPherson", rear_suspension: "Independente Multibraço",
      front_brake: "Discos ventilados", rear_brake: "Discos ventilados",
      trunk_liters: 435, approach_angle: 17.0, departure_angle: 23.0,
      city_consumption: 13.5, highway_consumption: 11.9,
      city_consumption_ethanol:  nil,   highway_consumption_ethanol:  nil,
    },
    prices: [ { price: 249_990.00, month: "2026-05-01", code: "032002-1" } ],
    maintenances: [ { km: 20_000, cost: 220 }, { km: 40_000, cost: 380 } ],
    defects: [],
    reviews: [ { rating: 4.6, comment: "950 km de autonomia total elimina a ansiedade de recarga" }, { rating: 4.4, comment: "Motor elétrico na traseira dá tração excelente" } ]
  }
]

vehicles_data.each do |data|
  brand = Brand.find_or_create_by!(name: data[:brand])

  vehicle = Vehicle.find_or_create_by!(
    brand: brand, name: data[:name], version: data[:version], year: data[:year]
  )
  vehicle.update!(
    launch_price:    data[:launch_price],
    exterior_colors: data[:exterior_colors] || [],
    interior_colors: data[:interior_colors] || []
  )

  spec_attrs = data[:spec].merge(source: "seed", verified_at: Date.new(2026, 2, 1))

  if vehicle.technical_spec
    vehicle.technical_spec.update!(spec_attrs)
  else
    vehicle.create_technical_spec!(spec_attrs)
  end

  if data[:ev_spec]
    ev_attrs = data[:ev_spec].merge(source: "seed", verified_at: Date.new(2026, 2, 1))
    if vehicle.ev_spec
      vehicle.ev_spec.update!(ev_attrs)
    else
      vehicle.create_ev_spec!(ev_attrs)
    end
  end

  data[:prices].each do |p|
    vehicle.fipe_prices.find_or_create_by!(reference_month: p[:month]) do |fp|
      fp.price     = p[:price]
      fp.fipe_code = p[:code]
      fp.fuel_type = data[:spec][:fuel_type]
    end
  end

  data[:maintenances].each do |m|
    vehicle.maintenances.find_or_create_by!(km_interval: m[:km]) do |rec|
      rec.avg_cost = m[:cost]
      rec.source   = "seed"
    end
  end

  data[:defects].each do |d|
    vehicle.defects.find_or_create_by!(description: d[:desc]) do |rec|
      rec.frequency = d[:freq]
      rec.source    = "seed"
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
