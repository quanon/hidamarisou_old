class RoomsController < ApplicationController
  def index
    @rooms = Room.order(:number).all
  end
end
