class UserCommentsController < ApplicationController
  def create
    @comment = UserComment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.victim_id = params[:user_id].to_i

    flash[:errors] = @comment.errors.full_messages unless @comment.save

    redirect_to user_url(@comment.victim)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
