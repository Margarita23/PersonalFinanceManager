class User < ApplicationRecord
  has_secure_password

	has_many :categories, dependent: :destroy
	has_many :operations, through: :categories

  validates :login, presence: true, uniqueness: true
	validates :password, length: { minimum: 6 }, if: -> { password.present? }
end
