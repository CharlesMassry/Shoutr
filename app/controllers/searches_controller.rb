class SearchesController < ApplicationController
  def show
    @search = TextShout.search(params[:search])
  end
end
