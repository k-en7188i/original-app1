class FavoritesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @post = Post.find(params[:post_id])
      current_user.favorites.create(post: @post)
      redirect_to @post, notice: 'お気に入りに追加しました。'
    end
  
    def destroy
      @post = Post.find(params[:post_id])
      current_user.favorites.find_by(post: @post).destroy
      redirect_to @post, notice: 'お気に入りから削除しました。'
    end
  
end
