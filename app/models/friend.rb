class Friend < ApplicationRecord
  validates :name, length: { minimum: 3 }
  validates :name, presence: true

  validates :surname, length: { minimum: 5 }
  validates :surname, presence: true

  validates :email, length: { minimum: 5 }
  validates :email, presence: true

  enum place: %i[ school work party vacation shop gym restaurant gallery other ]
  validates :place, inclusion: { in: places.keys }

  scope :school, -> { where(place: :school) }
  scope :work, -> { where(place: :work) }
  scope :party, -> { where(place: :party) }
  scope :vacation, -> { where(place: :vacation) }
  scope :shop, -> { where(place: :shop) }
  scope :gym, -> { where(place: :gym) }
  scope :restaurant, -> { where(place: :restaurant) }
  scope :gallery, -> { where(place: :gallery) }
end
