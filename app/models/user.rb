class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tweets, through: :favorites, source: :tweet
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :following, through: :active_relationships, source: :follower
  has_many :followers, through: :passive_relationships, source: :following

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  validates :name, presence: true

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
