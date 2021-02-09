class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :droid

  validates :start_date, :end_date, presence: true

  def find_user(user_id)
    User.find(user_id).name
  end
end
