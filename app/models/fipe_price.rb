class FipePrice < ApplicationRecord
  belongs_to :vehicle

  validates :price,           presence: true, numericality: { greater_than: 0 }
  validates :reference_month, presence: true
end
