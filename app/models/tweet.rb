class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :body, presence: true, length: {maximum: 140}
  validates :user_id, presence: true
  default_scope -> {order(created_at: :desc)}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      where(['body LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
