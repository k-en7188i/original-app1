class ChecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    @check = current_user.checks.create!(post_id: params[:post_id])
    redirect_to posts_path
  end

  def destroy
    @check = current_user.checks.find_by!(post_id: params[:post_id])
    @check.destroy
    redirect_to posts_path
  end

  # def check
  #   # find_or_create_byとは、「レコードがなければ作り、あればレコード情報を返す」というメソッド
  #   Check.find_or_create_by(user_id: current_user.id, post_id: @post.id)
  #   # 既読のレコードを作成したら詳細ページを表示
  #   redirect_to controller: :posts, action: :show, id: @post.id
  # end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # def revert_check
  #   set_post
  #   check = Check.find_by(user_id: current_user.id, post_id: @post.id)
  #   check&.destroy

  #   redirect_to controller: :posts, action: :show, id: @post.id
  # end
end
