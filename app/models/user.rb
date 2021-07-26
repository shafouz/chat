class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages

  has_secure_password

  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 260 },
    format: { with: VALID_EMAIL_FORMAT }, uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase }
end
