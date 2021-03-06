class ShoutsController < ApplicationController
  def create
    text_shout = TextShout.new(text_shout_params)
    shout = current_user.shouts.new(content: text_shout)
    if shout.save
      redirect_to dashboard_path
    else
      render "dashboard/show"
    end
  end

  private

  def text_shout_params
    params.require(:shout).permit(:content)
  end
end
