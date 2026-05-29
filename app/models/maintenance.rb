class Maintenance < ApplicationRecord
  belongs_to :vehicle

  validates :km_interval, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :km_interval, uniqueness: { scope: :vehicle_id }
end
