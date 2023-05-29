class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    # @posts = Post.all
    # @user = @post.user
    @posts = Post.all.includes(:user)

    @user = current_user # サインインしているユーザーを取得するために、current_userを使用します
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

  # 検索機能
  def search
    @posts = Post.search(params[:title])
  end

  # インクリメントサーチ機能
  # json形式で検索結果データを返すので完全が必要
  # def search
  #   return nil if params[:title] == ""
  #   posts = Post.where(['title LIKE ?', "%#{params[:title]}%"])
  #   render json: posts
  # end

  # 既読機能
  def check_read
    user_id = params[:user_id]
    post_id = params[:post_id]

    read = Check.where(user_id: user_id, post_id: post_id).exists?
    render json: { read: read }
  end

  # ランキング機能
  def ranking
    @posts = Post.ranking.limit(8)  # ランキング上位8件を取得
  end

  private

  def set_item
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :urllink, :category_id, :image).merge(user_id: current_user.id)
  end
end
