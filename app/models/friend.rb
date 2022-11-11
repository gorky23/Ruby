class Friend < ApplicationRecord
  validates :name, length: { minimum: 3 }
  validates :name, presence: true

  validates :surname, length: { minimum: 5 }
  validates :surname, presence: true

  validates :email, length: { minimum: 5 }
  validates :email, presence: true

  enum place: %i[ school work party vacation shop gym restaurant gallery other ]
end
