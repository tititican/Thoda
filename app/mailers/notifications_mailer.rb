class NotificationsMailer < ActionMailer::Base

  default :to => "info@abbo.com.vn"

  def new_message(message)
    @message = message
    mail(:from => message.email, :subject => "#{message.subject}")
  end

end