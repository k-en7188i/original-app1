class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー登録時の性別選択プルダウン

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :gender
    

    has_many :posts, dependent: :destroy
    has_many :comments  # commentsテーブルとのアソシエーション
    has_many :likes

    # ランキング機能
    # has_many :liked_posts, through: :likes, source: :post

    has_many :favorites, dependent: :destroy

    has_many :favorite_posts, through: :favorites, source: :post


    # ActiveStorageの記述/ユーザー登録時の画像投稿準備
    has_one_attached :image_profile

    # バリデーションの記述
    validates :nickname, presence: true
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :birth_date, presence: true
    validates :gender_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }



end
