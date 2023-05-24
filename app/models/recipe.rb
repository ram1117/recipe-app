class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :food, through: :recipe_food

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
end
