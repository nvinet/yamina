class ContactController < ApplicationController
  def index
    @contact = flash[:contact] ? flash[:contact] : Contact.new
    @rooms = ROOMS["rooms"].sort_by {|room| room["priceMin"]}
  end
end
