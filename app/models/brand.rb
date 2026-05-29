class Brand < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def slug
    name.parameterize
  end
end
