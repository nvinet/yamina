class ContactController < ApplicationController
  def index
    if flash[:contact]
      @contact = flash[:contact]
    else
      @contact = Contact.new
    end
    @rooms = Room.all
  end

  def submit
    @contact = Contact.new(params[:contact])
    @contact.arrival = Date.civil(params[:arrival][:year].to_i, params[:arrival][:month].to_i, params[:arrival][:day].to_i)
    @contact.departure = Date.civil(params[:departure][:year].to_i, params[:departure][:month].to_i, params[:departure][:day].to_i)
    if @contact.valid?
      @customer = Customer.where(:email => @contact.email).first_or_create(params[:contact])
      @customer.save
      ContactMailer.enquire(@contact).deliver
      flash[:success] = true
      redirect_to :action => 'index'
    else
      flash[:contact] = @contact
      redirect_to :action => 'index'
    end
  end
end
