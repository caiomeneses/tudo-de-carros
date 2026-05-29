class Vehicle < ApplicationRecord
  belongs_to :brand
  has_one    :technical_spec, dependent: :destroy
  has_one    :ev_spec,        dependent: :destroy
  has_many   :maintenances,   dependent: :destroy
  has_many   :defects,        dependent: :destroy
  has_many   :reviews,        dependent: :destroy
  has_many   :fipe_prices,    dependent: :destroy

  validates :name,    presence: true
  validates :version, presence: true
  validates :year,    presence: true, numericality: { only_integer: true, greater_than: 1900 }
  validates :name, uniqueness: { scope: [ :brand_id, :version, :year ] }
end
