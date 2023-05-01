class Post < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image


  validates :title, :content, :urllink, :category_id, presence: true 
end
