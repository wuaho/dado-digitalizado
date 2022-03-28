class Game < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings
end
