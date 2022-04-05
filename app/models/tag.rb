class Tag < ApplicationRecord
  has_and_belongs_to_many :games

  validates :name,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, too_short: '%{count} characters is the minimum allowed' }
end
