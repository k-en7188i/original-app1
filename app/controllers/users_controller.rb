class UsersController < ApplicationController
  def show
    def show
      user = User.find(params[:id])
      @nickname = user.nickname
      @posts = user.posts
    end
  end
end
