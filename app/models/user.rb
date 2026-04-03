class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :name, presence: true
end