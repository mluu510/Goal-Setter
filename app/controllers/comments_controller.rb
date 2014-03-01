class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id

    if params[:user_id]
      @comment.commentable_id = params[:user_id].to_i
      @comment.commentable_type = "User"
    else
      @comment.commentable_id = params[:goal_id].to_i
      @comment.commentable_type = "Goal"
    end

    flash[:errors] = @comment.errors.full_messages unless @comment.save

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end


