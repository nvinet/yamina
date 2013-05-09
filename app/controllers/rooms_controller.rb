class RoomsController < ApplicationController
  def index
    @rooms = Room.all.sort_by {|room| room.priceMin}
  end
end
