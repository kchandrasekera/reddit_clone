class LinksController < ApplicationController

  def create
    @link = Link.new(params[:link])
    @link.submitter_id = current_user.id

    @sub = Sub.find(params[:sub_id])

    @link.sub_id = @sub.id

    if @link.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @link.errors.full_messages
      redirect_to sub_url(@sub)
    end
  end

  def edit

  end

  def update

  end

  def show
    @link = Link.find(params[:id])

    render :show
  end

  def destroy

  end
end
