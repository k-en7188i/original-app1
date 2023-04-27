class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
 
    if @post.save
      render 'create'
      # redirect_to root_path
    else
      render :new
    end
  end


  private

    def post_params
      params.require(:post).permit(:title, :content, :urllink, :category_id).merge(user_id: current_user.id)
    end

end
