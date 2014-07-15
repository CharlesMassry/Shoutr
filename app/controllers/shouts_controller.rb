class ShoutsController < ApplicationController
  def create
    shout = current_user.shouts.new(shout_params)
    if shout.save
      redirect_to dashboard_path
    else
      render "dashboard/show"
    end
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
