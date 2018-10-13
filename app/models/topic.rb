class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments

  # 現在のユーザーがいいねしてたらtrueを返す
  def favo?(user)
    favorite_users.include?(user)
  end

  # トピックのいいねを削除する
  def uniine(user)
    favorites.find_by(user_id: user.id).destroy
  end

end
