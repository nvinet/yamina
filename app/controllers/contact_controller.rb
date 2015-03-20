class ContactController < ApplicationController
  def index
    @rooms = ROOMS["rooms"].sort_by {|room| room["priceMin"]}
  end
end
