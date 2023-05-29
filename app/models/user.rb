class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー登録時の性別選択プルダウン

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  has_many :posts, dependent: :destroy
  has_many :comments # commentsテーブルとのアソシエーション
  has_many :likes

  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  # 既読機能
  has_many :checks, dependent: :destroy
  has_many :posts, through: :checks

  # フォロー機能
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  # ActiveStorageの記述/ユーザー登録時の画像投稿準備
  has_one_attached :image_profile

  # バリデーションの記述
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :birth_date, presence: true
  validates :gender_id, presence: true, numericality: { other_than: 1, message: '『 --- 』以外を選択してください' }

  # フォロー機能
  def followed_by?(user)
    follower = passive_relationships.find_by(following_id: user.id)
    follower.present?
  end
end
