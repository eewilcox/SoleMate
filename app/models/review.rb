class Review < ApplicationRecord

  belongs_to :shoe
  has_many :votes
  has_many :users, through: :votes

  validates :rating, presence: true, numericality: { only_integer: true}, inclusion: { in: 1..5, message: "must be between 1 - 5"}
  validates :shoe, presence: true

end
