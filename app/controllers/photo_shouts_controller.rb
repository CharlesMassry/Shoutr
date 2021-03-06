class PhotoShoutsController < ApplicationController
  def create
    photo_shout = PhotoShout.new(photo_shout_params)
    shout = current_user.shouts.new(content: photo_shout)
    if shout.save
      redirect_to dashboard_path
    else
      render "dashboard/show"
    end
  end

  def destroy
    photo_shout = PhotoShout.find(params[:id])
    photo_shout.image.destroy
    photo_shout.shout.delete
    photo_shout.delete
    redirect_to dashboard_path
  end

  private

  def photo_shout_params
    params.require(:photo_shout).permit(:image)
  end
end
