class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  # いいね機能
  has_many :likes
# お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  has_one_attached :image

  validates :title, :content, :urllink, presence: true
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def likes_count
    likes.count
  end

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
