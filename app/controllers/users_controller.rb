class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @posts = current_user.posts
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_posts = @user.favorites.includes(:post)
  end
end
