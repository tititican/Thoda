class NotificationsMailer < ActionMailer::Base

  default :to => "an@abbo.com.vn"

  def new_message(message)
    @message = message
    mail(:from => message.email, :subject => "#{message.subject}")
  end

end