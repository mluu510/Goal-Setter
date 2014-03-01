class GoalCommentsController < ApplicationController
  def create
    @comment = GoalComment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.goal_id = params[:goal_id].to_i

    flash[:errors] = @comment.errors.full_messages unless @comment.save

    redirect_to goal_url(@comment.goal)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
