class SubsController < ApplicationController
  before_filter :require_current_user!, :only => [:edit, :update]
  before_filter :require_correct_user!, :only => [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @users = User.all
    @sub = Sub.find(params[:id])

    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(params[:sub])
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def require_current_user!
    unless logged_in?
      flash[:errors] = ["You must be logged in to access that"]
      redirect_to new_session_url
    end
  end

  def require_correct_user!
    @sub = Sub.find(params[:id])
    if current_user.id != @sub.moderator_id
      flash[:errors] = ["You must be the moderator to edit that form"]
      redirect_to new_session_url
    end
  end
end
