class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @review = Review.new
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews.includes(:user)
  end

  def create
    @post = Post.find(params[:post_id])
    @review = @post.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to post_reviews_path(@post), notice: 'Review created successfully.'
    else
      render 'posts/show'
    end
  end

  # レビューする画面
  def show
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:score, :content)
  end
end
