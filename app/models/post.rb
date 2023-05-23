class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  # commentsテーブルとのアソシエーション
  has_many :comments

  # いいね機能
  has_many :likes, dependent: :destroy

  # ランキング機能（いいねの数をカウントしたい時、どの投稿にいいねしたか表示したい時）　
  has_many :liked_users, through: :likes, source: :user

  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  # ActiveStorageの記述
  has_one_attached :image

  # バリデーションの記述
  validates :title, :content, :urllink, presence: true
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  # ランキング機能
  def self.ranking
    left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
  end

  # いいね機能
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def likes_count
    likes.count
  end

  # 検索機能
  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
