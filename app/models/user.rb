class User < ApplicationRecord
  VALED_PASSWORD_REGEX = /([0-9].*[a-zA-Z].*|[a-zA-Z].*[0-9].*)/
  VALED_EMAIL_REGEX = /.+@.+\..+/

  validates :name, presence: true, length: { maximum: 15}
  validates :email, presence: true, format: {with: VALED_EMAIL_REGEX}
  validates :password, length: { in: 8..32}, format: {with: VALED_PASSWORD_REGEX}
  validates :password_confirmation, length: { in: 8..32}, format: {with: VALED_PASSWORD_REGEX}

  has_secure_password

  has_many :topics
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
