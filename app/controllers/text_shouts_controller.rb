class TextShoutsController < ApplicationController
  def create
    @text_shout = TextShout.new(text_shout_params)
    shout = current_user.shouts.new(content: @text_shout)
    if shout.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js {}
        format.json { render json: @text_shout.to_json }
      end
    else
      render "dashboard/show"
    end
  end

  def destroy
    text_shout = TextShout.find(params[:id])
    text_shout.shout.delete
    text_shout.delete
    redirect_to dashboard_path
  end

  private

  def text_shout_params
    params.require(:text_shout).permit(:content)
  end
end
