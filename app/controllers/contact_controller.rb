class ContactController < ApplicationController
  def index
    if flash[:enquiry]
      @enquiry = flash[:enquiry]
    else
      @enquiry = Enquiry.new(:customer => Customer.new)
    end
  end

  def submit
    @enquiry = Enquiry.new(params[:enquiry])
    @enquiry.subject = 'test'
    @enquiry.customer = Customer.new(params[:customer])
    if @enquiry.valid?
      @enquiry.save
      ContactMailer.enquire(@enquiry).deliver
      flash[:success] = true
      redirect_to :action => 'index'
    else
      flash[:enquiry] = @enquiry
      redirect_to :action => 'index'
    end
  end
end
