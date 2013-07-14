class BookingController < ApplicationController
  include ApplicationHelper

  def index
    session.delete('booking')
    session.delete('pricing')

    @booking = flash[:booking] ? flash[:booking] : Booking.new
    @rooms = Room.all
  end

  def confirm
    @booking = Booking.new(params[:booking])
    @booking.arrival = Date.civil(params[:arrival][:year].to_i, params[:arrival][:month].to_i, params[:arrival][:day].to_i)
    @booking.departure = Date.civil(params[:departure][:year].to_i, params[:departure][:month].to_i, params[:departure][:day].to_i)
    @pricing = calculate_price(@booking)
    if !@booking.valid?
      flash[:booking] = @booking
      redirect_to :action => 'index'
    end
    @booking.status = 'PENDING'
    @booking.save()
    @rooms = Room.all
  end

  def success
    @id = params[:id]
    if @id
      @booking = Booking.find(@id)
      if @booking
        @booking.status = 'SUCCESS'
        @booking.save()
        @pricing = calculate_price(@booking)
        ContactMailer.confirm(@booking, @pricing).deliver
      end
    end
    session.delete('booking')
    session.delete('pricing')
    redirect_to :action => 'index'
  end

  def notify
    @id = params[:id]
    if @id
      @booking = Booking.find(@id)
      if @booking
        @booking.status = 'COMPLETED'
        @booking.save()
        @pricing = calculate_price(@booking)
        ContactMailer.ref(@booking, @pricing).deliver
      end
    end
    session.delete('booking')
    session.delete('pricing')
    redirect_to :action => 'index'
  end

  def cancel
    @id = params[:id]
    if @id
      @booking = Booking.find(@id)
      if @booking
        @booking.status = 'CANCEL'
        @booking.save()
      end
    end
    session.delete('booking')
    session.delete('pricing')
    redirect_to :action => 'index'
  end
end
