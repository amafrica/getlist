class SetlistController < ApplicationController

  def show
    @setlist = Setlist.find(params[:id])
  end

  def create
    @setlist = Setlist.new(setlist_params)

    if @setlist.save
      redirect_to setlist_path
    else
      render :new
    end
  end

  private

  def setlist_params
    params.require(:setlist).permit(:title, :description)
  end
end
