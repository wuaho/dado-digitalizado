class Game < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings
  has_and_belongs_to_many :tags
end
