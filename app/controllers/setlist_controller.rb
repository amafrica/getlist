class SetlistController < ApplicationController

  def index
    @setlists = Setlist.all
  end

  def show
    @setlist = Setlist.find(params[:id])
  end

  def update
    @setlist = Setlist.find(params[:id])

    if @setlist.update_attributes(setlist_params)
      redirect_to setlist_url(@setlist)
    else
      render :edit
    end
  end

  def create
    @setlist = Setlist.new(setlist_params)

    if setlist.save
      redirect_to show_url, notice: "You have created a setlist!"
    end
  end

  def new
    @setlist = Setlist.new
    @setlist.save
  end

  private

  def setlist_params
    params.require(:setlist).permit(:title, :description)
  end
end
