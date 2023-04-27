class Post < ApplicationRecord
  validates :title, :content, :urllink, :category_id, presence: true 
  belongs_to :user
  
end
