class ContactController < ApplicationController
	def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to("#contact", :notice => "Message was successfully sent.")
    else
      #flash.now.alert = ""
      redirect_to("#contact", :notice => "Please fill all fields - Message was unsuccessfully sent!")
    end
  end
end
