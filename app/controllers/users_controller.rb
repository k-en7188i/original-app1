class UsersController < ApplicationController
    def show
      user = User.find(params[:id])
      @nickname = user.nickname
      @posts = user.posts
    end

    def favorites
      @user = User.find(params[:id])
      @favorite_items = @user.items
    end
    
end
