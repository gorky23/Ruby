class Friend < ApplicationRecord
  validates :name, length: { minimum: 5 }
  validates :name, presence: true

  validates :surname, length: { minimum: 5 }
  validates :surname, presence: true

  validates :email, length: { minimum: 5 }
  validates :email, presence: true
end
