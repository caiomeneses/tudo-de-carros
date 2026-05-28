class Car < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1885 }
end
