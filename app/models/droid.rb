class Droid < ApplicationRecord
  belongs_to :user
  validates :name, :address, :description, :price, presence: true

  has_many :bookings
  has_many :categories, dependent: :destroy

  has_one_attached :photo
end
