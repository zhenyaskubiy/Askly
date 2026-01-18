class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nicknaame

  validates :email, presence: true, uniqueness: true

  def downcase_nicknaame
    nickname.downcase!
  end
end
