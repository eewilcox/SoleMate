class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :shoes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :username, length: { maximum: 15 }
  validates :username, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
