class EvSpec < ApplicationRecord
  belongs_to :vehicle

  POWERTRAIN_TYPES = %w[BEV PHEV HEV REEV].freeze

  validates :vehicle, uniqueness: true
  validates :powertrain_type, inclusion: { in: POWERTRAIN_TYPES }, allow_nil: true
  validates :battery_capacity_kwh, numericality: { greater_than: 0 }, allow_nil: true
  validates :range_km_wltp,    numericality: { greater_than: 0 }, allow_nil: true
  validates :range_km_inmetro, numericality: { greater_than: 0 }, allow_nil: true
  validates :range_km_total,   numericality: { greater_than: 0 }, allow_nil: true
end
