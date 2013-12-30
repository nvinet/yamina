class BookingController < ApplicationController
  include ApplicationHelper

  def index
    redirect_to controller: 'contact'
  end

  def confirm
    redirect_to controller: 'contact'
  end

  def success
    redirect_to controller: 'contact'
  end

  def notify
    redirect_to controller: 'contact'
  end

  def cancel
    redirect_to controller: 'contact'
  end
end
