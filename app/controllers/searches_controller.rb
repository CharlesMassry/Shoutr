class SearchesController < ApplicationController
  def show
    @search = Shout.search(params[:search])
    if params[:utf8]
      redirect_to "/search?=#{params[:search]}"
    end
  end
end
