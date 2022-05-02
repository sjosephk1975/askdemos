class Inbox < ApplicationRecord
  belongs_to :user

  MIN_NAME = 6
  MAX_NAME = 1000

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: MIN_NAME..MAX_NAME }
end
