class TechnicalSpec < ApplicationRecord
  belongs_to :vehicle

  validates :vehicle, uniqueness: true
end
