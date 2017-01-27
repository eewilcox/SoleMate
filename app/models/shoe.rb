class Shoe < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy

  validates :model, presence: true
  validates :version, presence: true
  validates :brand, presence: true
  validates :picture, presence: true
  validates :picture, format: { with: URI::regexp(%w(http https)) }
  validates :year, presence: true, length: { is: 4 }, numericality: { only_integer: true }
  validates :price, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}
  validates :description, presence: true
  validates :user, presence: true

  def self.search(search)
  where("brand ILIKE ? OR model ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
