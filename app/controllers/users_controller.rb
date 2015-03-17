class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @valid_goals = []
    if @user.id == current_user.id
      @valid_goals = @user.goals
    else
      @valid_goals = @user.goals.where(privated: false)
    end
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
