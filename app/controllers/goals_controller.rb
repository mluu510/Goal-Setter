class GoalsController < ApplicationController
  before_action :ensure_signed_in
  before_action :ensure_owner, :only => [:edit, :update, :destroy]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.viewable_by_others ||= false

    if @goal.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    get_goal
  end

  def update
    get_goal
    if @goal.update_attributes(goal_params)
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    get_goal.destroy
    redirect_to user_url(current_user)
  end

  def mark_as_complete
    @goal = Goal.find(params[:goal_id])
    @goal.completed = true
    @goal.save!
    redirect_to user_url(@goal.user_id)
  end

  private
  def get_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :viewable_by_others)
  end

  def ensure_signed_in
    unless signed_in?
      flash[:error] = ["You must be signed in to view that page"]
      redirect_to new_session_url
    end
  end

  def ensure_owner
    # @goal = Goal.find(params[:goal_id])
    get_goal
    unless current_user.id == @goal.user_id
      flash[:errors] = ["We got a wise guy eh?"]
      redirect_to user_url(params[:user_id])
    end
  end
end
