class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    # @posts = Post.all
    # @user = @post.user
    @posts = Post.includes(:user, :reviews).all

    @user = current_user # サインインしているユーザーを取得するために、current_userを使用します

    @post = Post.first

    # レビュー機能
    @review = Review.new
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

    # 既読機能
    return if @post.checks.exists?(user: current_user)

    @post.checks.create(user: current_user)
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
  # json形式で検索結果データを返すので改善が必要
  def search
    return if params[:title].blank?
  
    @posts = Post.where('title LIKE ?', "%#{params[:title]}%")
    respond_to do |format|
      format.html { render partial: 'search_results', layout: false }
      format.json { render json: @posts }
    end
  end

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
