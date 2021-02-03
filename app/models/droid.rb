class Droid < ApplicationRecord
  belongs_to :user
  validates :name, :address, :description, :price, presence: true

  has_many :categories, through: :droid_categories
  has_many :bookings
end
