class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      log_in_user(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
