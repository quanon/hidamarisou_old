class RoomsController < ApplicationController
  def index
    @rooms = Room.order(:number).all
  end

  def show
    @room = Room.find(params[:id])
  end
end
