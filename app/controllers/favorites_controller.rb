class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.create(post: @post)
    respond_to do |format|
      format.html { redirect_to @post, notice: 'お気に入りに追加しました。' }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post: @post)
    return unless @favorite

    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'お気に入りから削除しました。' }
      format.js
    end
  end
end
