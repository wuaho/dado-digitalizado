class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :game
  PERIOD = 7
  scope :active, -> { where('starts_on <= ?', Date.today).where('expires_on >= ?', Date.today) }
end
