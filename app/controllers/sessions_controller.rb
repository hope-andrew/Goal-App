class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
                                     params[:user][:password])
    if @user.nil?
      flash[:errors] = ["No User Found"]
      redirect_to new_session_url
    else
      login_user(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    log_out_user
    redirect_to new_session_url
  end
end
