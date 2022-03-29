class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :game

  #This doesnt work properly now, the starts on at least is not
  scope :active, -> { where('starts_on <= ? <= expires_on', Date.today) }
end
