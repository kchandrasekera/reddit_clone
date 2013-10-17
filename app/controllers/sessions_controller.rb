class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(username, password)

    unless @user.nil?
      log_in_user(@user)
      redirect_to new_session_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    current_user.session_token = reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
