class Category < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :droid_categories
end
