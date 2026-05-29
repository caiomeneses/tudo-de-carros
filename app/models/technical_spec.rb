class TechnicalSpec < ApplicationRecord
  belongs_to :vehicle

  ENGINE_CYCLES = %w[Otto Atkinson Miller Diesel].freeze

  validates :vehicle, uniqueness: true
  validates :engine_cycle, inclusion: { in: ENGINE_CYCLES }, allow_nil: true
end
