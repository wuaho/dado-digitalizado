class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :game

  scope :active, -> { where('starts_on <= ?', Date.today).where('expires_on >= ?', Date.today) }
end
