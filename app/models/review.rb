class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :title,
            presence: true,
            length: { minimum: 2, maximum: 70 }
  validates :description,
            length: { maximum: 2000 }
  validates :rating,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
