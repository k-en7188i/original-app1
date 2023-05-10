class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(@comment.post), notice: 'コメントを投稿しました。'
    else
      redirect_to post_path(@comment.post), alert: 'コメントの投稿に失敗しました。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    @comment.destroy
    redirect_to post_path(@comment.post), notice: 'コメントを削除しました。'
  end
  
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
