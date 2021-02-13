class Droid < ApplicationRecord
  belongs_to :user
  validates :name, :address, :description, :price, presence: true

  has_many :bookings
  has_many :categories, dependent: :destroy

  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
