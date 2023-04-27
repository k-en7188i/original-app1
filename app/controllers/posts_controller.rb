class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @post = Post.all
  end

  def new
    # @post = Post.new
  end

  def create
    # @post = Post.new(item_params)
    # if @post.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end


end
