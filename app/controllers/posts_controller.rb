class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    # @posts = Post.all
    # @user = @post.user
    @posts = Post.all.includes(:user)
    

    @user = current_user  # サインインしているユーザーを取得するために、current_userを使用します

    # ランキング機能
    # @ranking_posts = Post.ranking.limit(10)  # ランキング上位10件を取得
    
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

  def show
    @posts = Post.all.includes(:user)
    @user = @post.user
    # @posts = Post.all.includes(:user)

    @comment = Comment.new
    @comments = @post.comments.includes(:user)

    @prev_post = Post.where('id < ?', @post.id).order('id DESC').first
    @next_post = Post.where('id > ?', @post.id).order('id ASC').first
  end

  def destroy
    @post.destroy
  end

  def edit
  end

  def update
    @post.update(post_params)
  end

  def search
    @posts = Post.search(params[:title])
  end

  private

  def set_item
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :urllink, :category_id, :image).merge(user_id: current_user.id)
  end
end
