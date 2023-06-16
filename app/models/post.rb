class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  has_many :reviews, dependent: :destroy # reviewsテーブルとのアソシエーション

  # commentsテーブルとのアソシエーション
  has_many :comments

  # いいね機能
  has_many :likes, dependent: :destroy

  # ランキング機能（いいねの数をカウントしたい時、どの投稿にいいねしたか表示したい時）　
  has_many :liked_users, through: :likes, source: :user

  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  # 既読機能
  has_many :checks, dependent: :destroy
  has_many :users, through: :checks

  # ActiveStorageの記述
  has_one_attached :image

  # バリデーションの記述
  validates :title, :content, :urllink, presence: true
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }

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

  # レビュー機能
  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f * 100 / 5
    end
  end
end
