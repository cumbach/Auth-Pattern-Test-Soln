class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = current_user.comments.new(comment_params)

    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to link_url(comment.link_id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to link_url(comment.link_id)
  end

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end

end
