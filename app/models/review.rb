class Review < ApplicationRecord

  belongs_to :shoe

  validates :rating, presence: true, numericality: { only_integer: true}, inclusion: { in: 1..5, message: "must be between 1 - 5"}
  validates :shoe, presence: true

end
