class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true, presence: true
  validates :email,
            format: { with: /^(.+)@(.+)$/, message: "Email invalid" },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
  validates :password,
            presence: true,
            length: { minimum: 6 }

  has_many :droids, dependent: :destroy
end
