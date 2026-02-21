class Category < ApplicationRecord
	belongs_to :user
	has_many :operations, dependent: :destroy

	validates :name, presence: true, uniqueness: { scope: :user_id, message: "Категорія вже існує." }

  	validates :description, presence: :true
end
