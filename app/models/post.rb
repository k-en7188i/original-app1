class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  belongs_to :user
  has_many :likes

  has_one_attached :image


  validates :title, :content, :urllink, presence: true 
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 


  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
