class Defect < ApplicationRecord
  belongs_to :vehicle

  FREQUENCIES = %w[alta media baixa].freeze

  validates :description, presence: true
  validates :frequency, presence: true, inclusion: { in: FREQUENCIES }
end
